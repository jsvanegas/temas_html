<%@ WebHandler Language="C#" Class="Servidor" %>

using System;
using System.Web;

using System.Web.Script.Serialization;

public class Servidor : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        var datos = new[] { 
            new { nombre="Carlos", apellido="Rojas", edad=14, correo="carojas@gmail.com"  },
            new { nombre="Andrea", apellido="Buitrago", edad=18, correo="anbrebuitrago@hotmail.com"  },
            new { nombre="Miguel", apellido="Sarmineto", edad=16, correo="msarmiento1@gmail.com"  },
            new { nombre="Karolina", apellido="Tellez", edad=23, correo="karo_tellez@gmail.com"  },
            new { nombre="David", apellido="Ceballos", edad=15, correo="davidceballos@yahoo.com"  },
            new { nombre="Milena", apellido="Botero", edad=20, correo="milena_botero2@hotmail.com"  },
            new { nombre="Andres", apellido="Espitia", edad=20, correo="espitia_andres@hotmail.com"  },
            new { nombre="Ruben", apellido="Velasquez", edad=21, correo="ruben.velasquez@hotmail.com"  },
            new { nombre="Alejandra", apellido="Torres", edad=16, correo="alejatorres@gmail.com"  },
            new { nombre="Daniel", apellido="Reyes", edad=17, correo="daniel_reyes87@gmail.com"  },
            new { nombre="Diana", apellido="Lopez", edad=18, correo="dianita_lopez@gmail.com"  },
            new { nombre="Freddy", apellido="Gomez", edad=15, correo="freddy.gomez3@hotmail.com"  },
            new { nombre="Sonia", apellido="Forero", edad=19, correo="sonia.forero@gmail.com"  },
            new { nombre="Juan", apellido="Gomez", edad=20, correo="juancagomez1@hotmail.com"  }
        };
        context.Response.Write(new JavaScriptSerializer().Serialize(datos));
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}