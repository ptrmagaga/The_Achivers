from rest_framework import serializers
from .models import ChatbotMessage

class ChatbotMessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ChatbotMessage
        fields = '__all__'
        read_only_fields = ['user', 'response', 'timestamp']
