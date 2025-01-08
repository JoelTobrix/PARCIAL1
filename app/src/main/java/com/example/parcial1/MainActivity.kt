package com.example.parcial1

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley


class MainActivity : AppCompatActivity() {
    private var username: EditText? = null
    private var password: EditText? = null
    private var add_button: Button? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //Vincular vistas
        username = findViewById(R.id.username)
        password = findViewById(R.id.pass)
        add_button = findViewById(R.id.button_ingresar)
        // Configurar acción del botón
        add_button?.setOnClickListener {
            guardarDatos()

        }
    }

    private fun guardarDatos() {
        val usuario = username?.text.toString().trim()
        val contraseña = password?.text.toString().trim()


        // Validar campos vacíos
        if (usuario.isEmpty() || contraseña.isEmpty()) {
            Toast.makeText(this, "Por favor, completa todos los campos.", Toast.LENGTH_SHORT).show()
            return
        }

        val url = "http://192.168.100.126/vehiculo/insertar.php"

        // Crear una solicitud POST
        val request = object : StringRequest(
            Request.Method.POST, url,
            Response.Listener { response ->
                // Verificar respuesta del servidor
                if (response.contains("Usuario ingresado correctamente.", ignoreCase = true)) {
                    Toast.makeText(this, "Contacto registrado", Toast.LENGTH_SHORT).show()
                    // Limpiar los campos después de insertar
                    username?.setText("")
                    password?.setText("")
                    abrirlistado()

                } else {
                    Toast.makeText(this, "Error al registrar: $response", Toast.LENGTH_SHORT).show()
                }
            },
            Response.ErrorListener { error ->
                val message = error.message ?: "Error desconocido"
                Toast.makeText(this, "Error: $message", Toast.LENGTH_SHORT).show()
            }
        ) {
            override fun getParams(): MutableMap<String, String> {
                // Enviar parámetros al servidor (coincidiendo con los nombres en PHP)
                val params = HashMap<String, String>()
                params["usuario"] = usuario
                params["contraseña"] = contraseña

                return params
            }
        }
        // Agregar la solicitud a la cola de Volley
        val queue = Volley.newRequestQueue(this)
        queue.add(request)

    }
    fun abrirlistado() {
        val intent= Intent(this,listado:: class.java)
        startActivity(intent)
    }
}




