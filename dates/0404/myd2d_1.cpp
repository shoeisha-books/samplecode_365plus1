#include <Windows.h>
#pragma comment(lib, "d2d1.lib")
#include <d2d1_3.h>
#include <cassert>

constexpr int WIDTH = 800;
constexpr int HEIGHT = 600;

class MyD2D {
public:
    MyD2D(HWND hwnd) {
        D2D1CreateFactory(
            D2D1_FACTORY_TYPE_SINGLE_THREADED,
            &factory_);
        factory_->CreateHwndRenderTarget(
            D2D1::RenderTargetProperties(),
            D2D1::HwndRenderTargetProperties(
                hwnd,
                D2D1::SizeU(WIDTH, HEIGHT)),
            &renderTarget_);
    }
    ~MyD2D() {
        renderTarget_->Release();
        factory_->Release();
    }
    ID2D1HwndRenderTarget* getRenderTarget() {
        return renderTarget_;
    }
private:
    ID2D1Factory8* factory_ = nullptr;
    ID2D1HwndRenderTarget* renderTarget_ = nullptr;
};