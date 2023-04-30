from django.shortcuts import render

from rest_framework import status
from rest_framework.decorators import APIView
from rest_framework.response import Response

from .models import SosStatement
from .serializers import SosSerializer

class SosList(APIView):
    def get(self, request, format=None):
        soslist = SosStatement.objects.all()
        serializer = SosSerializer(soslist, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):
        serializer = SosSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(status=status.HTTP_201_CREATED)
        
        return Response(status=status.HTTP_400_BAD_REQUEST)
