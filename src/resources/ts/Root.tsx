import '../sass/app.scss';
import React from 'react';
import { createRoot } from 'react-dom/client';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Home from '~/pages';
import NotFoundPage from '~/pages/404';

const Root: React.FC = () => (
  <BrowserRouter>
    <Routes>
      <Route path='/' element={<Home />} />
      <Route path='*' element={<NotFoundPage />} />
    </Routes>
  </BrowserRouter>
);

export default Root;

const container = document.getElementById('app');
if (container) {
  const app = createRoot(container);
  app.render(<Root />);
}
