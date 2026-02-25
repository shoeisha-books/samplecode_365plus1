#include <GLFW/glfw3.h>
#define GLFW_EXPOSE_NATIVE_WIN32
#define GLFW_NATIVE_INCLUDE_NONE
#include <GLFW/glfw3native.h>

class MyWindow
{
public:
    MyWindow(){
        assert(glfwInit());
        window_ = glfwCreateWindow(
            WIDTH, HEIGHT, "Shoeisha Calendar",
            nullptr, nullptr);
        if (!window_){
            glfwTerminate();
            assert(false);
        }
        glfwInitHint(GLFW_NO_API, GLFW_TRUE);
    }
    ~MyWindow(){
        glfwDestroyWindow(window_);
        glfwTerminate();
    }
    bool step(){
        if (glfwWindowShouldClose(window_))return false;
        glfwPollEvents();
        return true;
    }
    HWND getHwnd(){return glfwGetWin32Window(window_);}
private:
    GLFWwindow* window_;
};