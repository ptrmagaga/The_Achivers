from rest_framework import generics, permissions
from .models import FriendRequest
from .serializers import FriendRequestSerializer
from django.contrib.auth import get_user_model

User = get_user_model()

class SendFriendRequestView(generics.CreateAPIView):
    serializer_class = FriendRequestSerializer
    permission_classes = [permissions.IsAuthenticated]

    def perform_create(self, serializer):
        receiver_id = self.request.data.get('receiver')
        receiver = User.objects.get(id=receiver_id)
        serializer.save(sender=self.request.user, receiver=receiver)

class FriendRequestListView(generics.ListAPIView):
    serializer_class = FriendRequestSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return FriendRequest.objects.filter(receiver=self.request.user, status='pending')

class ChatMessageListView(generics.ListAPIView):
    serializer_class = ChatMessageSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return ChatMessage.objects.filter(receiver=self.request.user)

class SendMessageView(generics.CreateAPIView):
    serializer_class = ChatMessageSerializer
    permission_classes = [permissions.IsAuthenticated]

    def perform_create(self, serializer):
        receiver_id = self.request.data.get('receiver')
        receiver = User.objects.get(id=receiver_id)
        serializer.save(sender=self.request.user, receiver=receiver)
