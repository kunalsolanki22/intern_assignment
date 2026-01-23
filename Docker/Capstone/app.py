import streamlit as st

st.title("Hello World: Docker + Streamlit")
st.write("This app is running inside a Docker container!")

name = st.text_input("What is your name?", "User")
slider_val = st.slider("Select a value", 0, 100, 50)

st.write(f"Hello {name}! You selected: {slider_val}")
