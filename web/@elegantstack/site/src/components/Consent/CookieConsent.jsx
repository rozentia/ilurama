import * as React from 'react';
import { useLocation } from '@reach/router';
import { initializeAndTrack } from 'gatsby-plugin-gdpr-cookies';

function isBrowser() {
  return typeof window !== 'undefined';
}

function getValue(key, defaultValue) {
  return isBrowser() && window.localStorage.getItem(key)
    ? JSON.parse(window.localStorage.getItem(key))
    : defaultValue;
}

function setValue(key, value) {
  window.localStorage.setItem(key, JSON.stringify(value));
}

function useStickyState(defaultValue, key) {
  const [value, setter] = React.useState(() => {
    return getValue(key, defaultValue);
  });

  React.useEffect(() => {
    setValue(key, value);
  }, [key, value]);

  return [value, setter];
}

const CookieConsent = () => {
  const location = useLocation();
  if (isBrowser()) {
    initializeAndTrack(location);
  }

  const [bannerHidden, setBannerHidden] = useStickyState(
    false,
    'consentCookieHidden',
  );

  const EnableAnalytics = () => {
    document.cookie = 'gatsby-gdpr-google-analytics=true';
    setBannerHidden(true);
  };

  return (
    <>
      {!bannerHidden && (
        <div>
          <span>
            We use cookies to personalize content and analyze our
            traffic.
          </span>
          <button onClick={EnableAnalytics}>OK</button>
        </div>
      )}
    </>
  );
};

export default CookieConsent;