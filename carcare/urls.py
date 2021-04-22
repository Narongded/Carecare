from django.urls import path

from . import views

urlpatterns = [
    path('index/', views.index, name='index'),
    path('about/', views.about, name='about'),
    path('reservation/', views.reservation, name='reservation'),
    path('status/', views.status, name='status'),
    path('delivery/', views.delivery, name='delivery'),
    path('confirmation/<int:reservation_id>/', views.confirmation, name='confirmation'),
    path('satisfaction/<int:reservation_id>/', views.satisfaction, name='satisfaction'),
    path('login/', views.my_login, name='login'),
    path('logout/', views.my_logout, name='logout'),
    path('register/', views.my_register, name='register'),
    path('update/', views.update, name='update'),
    path('delete/<int:reservation_id>/', views.delete, name='delete')
]
