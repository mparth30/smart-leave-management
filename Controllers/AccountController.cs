using System.Web.Mvc;

namespace SmartLeave.Controllers
{
    public class AccountController : Controller
    {
        // GET: /Account/Login
        public ActionResult Login()
        {
            return View();
        }

        // POST: /Account/Login (simple placeholder)
        [HttpPost]
        public ActionResult Login(string email, string password)
        {
            // Placeholder - replace with real authentication (hashing, DB check)
            if(email == "admin@example.com" && password == "admin123")
            {
                // set session and redirect
                Session["UserEmail"] = email;
                Session["UserRole"] = "Admin";
                return RedirectToAction("Index", "Home");
            }
            ViewBag.Message = "Invalid credentials (use admin@example.com/admin123)";
            return View();
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login");
        }
    }
}
