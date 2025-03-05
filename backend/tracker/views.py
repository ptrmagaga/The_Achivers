from rest_framework import generics
from rest_framework.permissions import IsAuthenticated
from .models import Notification
from .serializers import NotificationSerializer
from .models import PregnancyStage
from .serializers import PregnancyStageSerializer

class PregnancyStageListView(generics.ListAPIView):
    serializer_class = PregnancyStageSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return PregnancyStage.objects.filter(user=self.request.user)


class NotificationListView(generics.ListAPIView):
    serializer_class = NotificationSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return Notification.objects.filter(user=self.request.user).order_by('-created_at')
    