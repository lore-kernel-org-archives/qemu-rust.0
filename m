Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tlWRi-0007Hd-By
	for mharc-qemu-rust@gnu.org; Fri, 21 Feb 2025 12:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRd-0006xK-Uf
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:04:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRb-0001S0-Kq
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740157447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gNzmdewlktR1o4K/cScPLtSavMlzl0xOpm3FGIzKcy0=;
 b=JZwcD019iFyxoaNDm1SnaHkR/+YaqcxufM49t+1gh8tpEh3BxQGv2Oumqr+CVYud55NuDY
 BOv8G0aIGFs5BfvA5Wwtz+D2Ap/vzQ8oqrx/ZXPZTsP/tak9D/OXWc9nR8Wwqy+SfQaVgY
 208hqwndA3ZMWp6cYFhkUF3KDNK88mQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-sRqB8p-GM7yXhLHTLmxXQw-1; Fri, 21 Feb 2025 12:04:05 -0500
X-MC-Unique: sRqB8p-GM7yXhLHTLmxXQw-1
X-Mimecast-MFC-AGG-ID: sRqB8p-GM7yXhLHTLmxXQw_1740157444
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38f28a4647eso1157001f8f.1
 for <qemu-rust@nongnu.org>; Fri, 21 Feb 2025 09:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740157443; x=1740762243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gNzmdewlktR1o4K/cScPLtSavMlzl0xOpm3FGIzKcy0=;
 b=mORDi3TdOsiwRC9+4FZ7BzItdwCGGe9JwFEjjEZPP/+dyfWPQv9iejd89bU3OfYsYl
 jkF34YcF+wgSQHAMZIvHGxT8pkYOpAVyYSBC25bdxfeG/yUjxgmCeS7EPEebAE0bMsXZ
 QWb3oSobUcBkOs+794SNDFH5KoveIRUcXKo9b09n2sIFsa+n0YQNsz+4tU49qZONWECA
 2qUH44CL/2iVBydRgzHCfax8gXR0JUACax5Nw8qkRDUhudZzZCMqItSqNl5bYs6wVKLU
 spT/bFoIZV48EB+AfzfwJ7hCq8QH4ZwfzKuouAvcOcO1jMSV3fO+QyVEs1+xCqQ2oQnu
 EqBg==
X-Gm-Message-State: AOJu0Yza+isXi6JH5Fs8Mymca2Z/rfgpqMfX4U5dG0fvv1j4yFHH8YPT
 pM2tpbTBnOgB83MaLfiEy9XWdY7hAPyo2vwbfgs1M5vpBU51p9LICtFM+cd9bpGyPoM0ixtxcxs
 jOxBsQgGvy+LPyV6cSdrLg97ECajGLP3S/cWym4BcUyOyMmq9yOqgl8PufMnUqQ==
X-Gm-Gg: ASbGncseW4R+e63+efYqX+WXtJA0nehFSc3zBuUgOUzLFcWx9E1LG5NfEm/68w0c9WL
 JXUSm8K72JDf1tClqHJ+qgifSUgg9dayG9yIHGotnEEiZ3+WYrEOhrqe4eZ7G2+dmLrLB8igOB+
 1TIDmZTmQpp3IWCPmtW94z5oatWjHrFsVPAfWZDRdnM9Ltl2l22FzCPHG8RCypLTZgtPW809xEy
 k+lwYmnWWMwRJZfju4zHaGSjVXW60XDqGWtq5f60jLIAn8R0bQq3b5SXH5TFu1fZ7STU5KN272J
 w3n2JPak8KqMi7qLptI=
X-Received: by 2002:a05:6000:144a:b0:38d:e092:3ced with SMTP id
 ffacd0b85a97d-38f6e7579e0mr2240546f8f.7.1740157441367; 
 Fri, 21 Feb 2025 09:04:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFIfNlkw2aTy/ScMYSgifoXhFGn8mMiTLNr3x9N+9gX7sv64GeERh/Ti9Kx0/Z/bQw7ou7CQ==
X-Received: by 2002:a05:6000:144a:b0:38d:e092:3ced with SMTP id
 ffacd0b85a97d-38f6e7579e0mr2240433f8f.7.1740157439353; 
 Fri, 21 Feb 2025 09:03:59 -0800 (PST)
Received: from [192.168.10.48] ([151.95.61.185])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f8273sm23366483f8f.89.2025.02.21.09.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 09:03:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 07/15] rust: qemu_api_macros: add Wrapper derive macro
Date: Fri, 21 Feb 2025 18:03:34 +0100
Message-ID: <20250221170342.63591-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221170342.63591-1-pbonzini@redhat.com>
References: <20250221170342.63591-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NBgwAAUf5suNg-YE4KabjgkrpALLHyDR4UbHoTcVqv8_1740157444
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.424,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Feb 2025 17:04:10 -0000

Add a derive macro that makes it easy to peel off all the layers of
specialness (UnsafeCell, MaybeUninit, etc.) and just get a pointer
to the wrapped type; and likewise add them back starting from a
*mut.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst             |  8 ++--
 rust/qemu-api-macros/src/lib.rs | 82 ++++++++++++++++++++++++++++++++-
 rust/qemu-api/meson.build       |  7 +--
 rust/qemu-api/src/cell.rs       | 31 +++++++++++++
 4 files changed, 119 insertions(+), 9 deletions(-)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 9a621648e72..db2b427ebd2 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -314,11 +314,13 @@ a raw pointer, for use in calls to C functions.  It can be used for
 example as follows::
 
     #[repr(transparent)]
-    #[derive(Debug)]
+    #[derive(Debug, qemu_api_macros::Wrapper)]
     pub struct Object(Opaque<bindings::Object>);
 
-The bindings will then manually check for the big QEMU lock with
-assertions, which allows the wrapper to be declared thread-safe::
+where the special ``derive`` macro provides useful methods such as
+``from_raw``, ``as_ptr`` and ``as_mut_ptr``.  The bindings will then
+manually check for the big QEMU lock with assertions, which allows
+the wrapper to be declared thread-safe::
 
     unsafe impl Send for Object {}
     unsafe impl Sync for Object {}
diff --git a/rust/qemu-api-macros/src/lib.rs b/rust/qemu-api-macros/src/lib.rs
index 7ec218202f4..781e5271562 100644
--- a/rust/qemu-api-macros/src/lib.rs
+++ b/rust/qemu-api-macros/src/lib.rs
@@ -6,7 +6,7 @@
 use quote::quote;
 use syn::{
     parse_macro_input, parse_quote, punctuated::Punctuated, spanned::Spanned, token::Comma, Data,
-    DeriveInput, Field, Fields, Ident, Meta, Path, Token, Type, Variant, Visibility,
+    DeriveInput, Field, Fields, FieldsUnnamed, Ident, Meta, Path, Token, Type, Variant, Visibility,
 };
 
 mod utils;
@@ -33,6 +33,35 @@ fn get_fields<'a>(
     }
 }
 
+fn get_unnamed_field<'a>(input: &'a DeriveInput, msg: &str) -> Result<&'a Field, MacroError> {
+    if let Data::Struct(s) = &input.data {
+        let unnamed = match &s.fields {
+            Fields::Unnamed(FieldsUnnamed {
+                unnamed: ref fields,
+                ..
+            }) => fields,
+            _ => {
+                return Err(MacroError::Message(
+                    format!("Tuple struct required for {}", msg),
+                    s.fields.span(),
+                ))
+            }
+        };
+        if unnamed.len() != 1 {
+            return Err(MacroError::Message(
+                format!("A single field is required for {}", msg),
+                s.fields.span(),
+            ));
+        }
+        Ok(&unnamed[0])
+    } else {
+        Err(MacroError::Message(
+            format!("Struct required for {}", msg),
+            input.ident.span(),
+        ))
+    }
+}
+
 fn is_c_repr(input: &DeriveInput, msg: &str) -> Result<(), MacroError> {
     let expected = parse_quote! { #[repr(C)] };
 
@@ -46,6 +75,19 @@ fn is_c_repr(input: &DeriveInput, msg: &str) -> Result<(), MacroError> {
     }
 }
 
+fn is_transparent_repr(input: &DeriveInput, msg: &str) -> Result<(), MacroError> {
+    let expected = parse_quote! { #[repr(transparent)] };
+
+    if input.attrs.iter().any(|attr| attr == &expected) {
+        Ok(())
+    } else {
+        Err(MacroError::Message(
+            format!("#[repr(transparent)] required for {}", msg),
+            input.ident.span(),
+        ))
+    }
+}
+
 fn derive_object_or_error(input: DeriveInput) -> Result<proc_macro2::TokenStream, MacroError> {
     is_c_repr(&input, "#[derive(Object)]")?;
 
@@ -72,6 +114,44 @@ pub fn derive_object(input: TokenStream) -> TokenStream {
     TokenStream::from(expanded)
 }
 
+fn derive_opaque_or_error(input: DeriveInput) -> Result<proc_macro2::TokenStream, MacroError> {
+    is_transparent_repr(&input, "#[derive(Wrapper)]")?;
+
+    let name = &input.ident;
+    let field = &get_unnamed_field(&input, "#[derive(Wrapper)]")?;
+    let typ = &field.ty;
+
+    // TODO: how to add "::qemu_api"?  For now, this is only used in the
+    // qemu_api crate so it's not a problem.
+    Ok(quote! {
+        unsafe impl crate::cell::Wrapper for #name {
+            type Wrapped = <#typ as crate::cell::Wrapper>::Wrapped;
+        }
+        impl #name {
+            pub unsafe fn from_raw<'a>(ptr: *mut <Self as crate::cell::Wrapper>::Wrapped) -> &'a Self {
+                let ptr = ::std::ptr::NonNull::new(ptr).unwrap().cast::<Self>();
+                unsafe { ptr.as_ref() }
+            }
+
+            pub const fn as_mut_ptr(&self) -> *mut <Self as crate::cell::Wrapper>::Wrapped {
+                self.0.as_mut_ptr()
+            }
+
+            pub const fn as_ptr(&self) -> *const <Self as crate::cell::Wrapper>::Wrapped {
+                self.0.as_ptr()
+            }
+        }
+    })
+}
+
+#[proc_macro_derive(Wrapper)]
+pub fn derive_opaque(input: TokenStream) -> TokenStream {
+    let input = parse_macro_input!(input as DeriveInput);
+    let expanded = derive_opaque_or_error(input).unwrap_or_else(Into::into);
+
+    TokenStream::from(expanded)
+}
+
 #[rustfmt::skip::macros(quote)]
 fn derive_offsets_or_error(input: DeriveInput) -> Result<proc_macro2::TokenStream, MacroError> {
     is_c_repr(&input, "#[derive(offsets)]")?;
diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index bcf1cf780f3..6e52c4bad74 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -42,16 +42,13 @@ _qemu_api_rs = static_library(
   override_options: ['rust_std=2021', 'build.rust_std=2021'],
   rust_abi: 'rust',
   rust_args: _qemu_api_cfg,
-  dependencies: libc_dep,
+  dependencies: [libc_dep, qemu_api_macros],
 )
 
 rust.test('rust-qemu-api-tests', _qemu_api_rs,
           suite: ['unit', 'rust'])
 
-qemu_api = declare_dependency(
-  link_with: _qemu_api_rs,
-  dependencies: qemu_api_macros,
-)
+qemu_api = declare_dependency(link_with: _qemu_api_rs)
 
 # Rust executables do not support objects, so add an intermediate step.
 rust_qemu_api_objs = static_library(
diff --git a/rust/qemu-api/src/cell.rs b/rust/qemu-api/src/cell.rs
index 84b9eb07467..c39b9616969 100644
--- a/rust/qemu-api/src/cell.rs
+++ b/rust/qemu-api/src/cell.rs
@@ -1017,3 +1017,34 @@ pub fn new() -> Self {
         Self::default()
     }
 }
+
+/// Annotates [`Self`] as a transparent wrapper for another type.
+///
+/// Usually defined via the [`qemu_api_macros::Wrapper`] derive macro.
+///
+/// # Examples
+///
+/// ```
+/// # use std::mem::ManuallyDrop;
+/// # use qemu_api::cell::Wrapper;
+/// #[repr(transparent)]
+/// pub struct Example {
+///     inner: ManuallyDrop<String>,
+/// }
+///
+/// unsafe impl Wrapper for Example {
+///     type Wrapped = String;
+/// }
+/// ```
+///
+/// # Safety
+///
+/// `Self` must be a `#[repr(transparent)]` wrapper for the `Wrapped` type,
+/// whether directly or indirectly.
+pub unsafe trait Wrapper {
+    type Wrapped;
+}
+
+unsafe impl<T> Wrapper for Opaque<T> {
+    type Wrapped = T;
+}
-- 
2.48.1


