export default function authHeader() {
  const tokenName = "idToken";
  const idToken = localStorage.getItem(tokenName);

  if (idToken) {
    return idToken;
  } else {
    return null;
  }
}
