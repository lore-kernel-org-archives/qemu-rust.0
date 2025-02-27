Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tneoB-0006jj-9T
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 09:24:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnemg-0003pz-78
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnemT-00044N-Cd
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740666148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DU8RnwXUCUOFmlQq7LelOhzzqajTuinw3yOxvFn4Jv4=;
 b=Bfx+HE4Ki4yH2d7wE9hbjWjVARpSbeLNZlezVIBX4dA4gmwHdHlqN0wCMjpxNuEr8mdnvZ
 6r5Bl8oLsLYRaEhL3t833hC5QRNQm3G7PTCR995eTCYWs7qbPPIHIGtsUPUNN1a4ccMZQV
 8CagOUe9afG59jxCSayUeOP1kc3EueY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-bNn1jzTSNPqUkn2VBWmiYQ-1; Thu, 27 Feb 2025 09:22:27 -0500
X-MC-Unique: bNn1jzTSNPqUkn2VBWmiYQ-1
X-Mimecast-MFC-AGG-ID: bNn1jzTSNPqUkn2VBWmiYQ_1740666146
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5e04de6583bso1482239a12.1
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 06:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740666146; x=1741270946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DU8RnwXUCUOFmlQq7LelOhzzqajTuinw3yOxvFn4Jv4=;
 b=bTZFQgcFAUMSCdeIA05pYJtWGIjvvwVJWjamxAn4yg4uDB9as15kYX78bULZF1dYK/
 bHreSDGaLS2K++6CFyUB2WUuxRiYI5w/31KC8rc1r2ZlgF/gpPwj5MfQsV0xny05Mpgy
 6KVHrGESCC5hYDDOfopL7rObiOMr3KtLCcT8Eq4LL/rPxMD/V7YgbDJ8K9UPY3/mjENO
 QVdCXNh9s5KvNUW2zT0rKbCzaV2wEWNr4mupjEF+qZ2vmWfquSmGp8U4iNTw4Tf0fd1F
 BiAWaK8+I3GuC6JiyslXD8BrA4P/TwWKyanYvk3gj2HBaLyiV+oU/muqzdxXyDnnlWRe
 /0Mw==
X-Gm-Message-State: AOJu0Yxa/H+oHIRLa2mXBNODVEATFFoGF4a54kEyatcUtZ6fqDDyjvOr
 ZEnA/poJGm8wotKcqKHtgCDaZEf3Kiivv/zSpblCNNrAPv6r4e62gfZInYjRoZ+x6dZY/W/B3nH
 ynQPRCsPv7ReDOWydYvajmrIKZIS6FtndwT24zdcv/rWiu424BhE=
X-Gm-Gg: ASbGncvFPDkZKRRZ9Qsztt4msOg6vnVCQJx8yDPWA11FDXEbihAEUe9RW2mO99LXybi
 NJtMhZlRLlaE6uJhl+8R0L9FxNDngQGC/HgIPtH2BFp/4ERZdPr9Fdt5nmTIR7pgmTtwrXxek33
 6inogZTcVzEmFefuQf9ZACZvMvsIvTXZH4VSYeD70npO8TajOdXJy6Bj/dVfysnS5IxXW4NhEpR
 W0mtdPMy8ppRMZFWoBWBWcjVQhIkcMS6r6py9EiHpyw4QryPVrhCm6aNES0QmOYgPmwnD8SQWan
 8+Vh7a3BtbxaBMBdgXFO
X-Received: by 2002:a05:6402:3595:b0:5e0:8c55:536 with SMTP id
 4fb4d7f45d1cf-5e444481531mr13914555a12.4.1740666145461; 
 Thu, 27 Feb 2025 06:22:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQEvRXKFNO8uqehyPrMvfwzyUwe/T2t9ikClNPL5YVhQNUna8NZ1lwhLuT9lhaB++h80+AvQ==
X-Received: by 2002:a05:6402:3595:b0:5e0:8c55:536 with SMTP id
 4fb4d7f45d1cf-5e444481531mr13914532a12.4.1740666145018; 
 Thu, 27 Feb 2025 06:22:25 -0800 (PST)
Received: from [192.168.10.48] ([176.206.102.52])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c3fb58f7sm1145654a12.57.2025.02.27.06.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 06:22:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 02/12] rust: qemu_api_macros: add Wrapper derive macro
Date: Thu, 27 Feb 2025 15:22:09 +0100
Message-ID: <20250227142219.812270-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227142219.812270-1-pbonzini@redhat.com>
References: <20250227142219.812270-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CYSDUeiH8-7PtH5Veei5-kvfOYHEnh4i2SLz1gQcEl8_1740666146
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-List-Received-Date: Thu, 27 Feb 2025 14:22:46 -0000

Add a derive macro that makes it easy to peel off all the layers of
specialness (UnsafeCell, MaybeUninit, etc.) and just get a pointer
to the wrapped type; and likewise add them back starting from a
*mut.

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst             |  8 +--
 rust/qemu-api-macros/src/lib.rs | 86 ++++++++++++++++++++++++++++++++-
 rust/qemu-api/meson.build       |  7 +--
 rust/qemu-api/src/cell.rs       | 31 ++++++++++++
 4 files changed, 123 insertions(+), 9 deletions(-)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 784c3e40bdc..64e04bc5c41 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -315,11 +315,13 @@ a raw pointer, for use in calls to C functions.  It can be used for
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
index 7ec218202f4..3df9c48035d 100644
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
 
@@ -72,6 +114,48 @@ pub fn derive_object(input: TokenStream) -> TokenStream {
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
+
+            pub const fn as_void_ptr(&self) -> *mut ::core::ffi::c_void {
+                self.0.as_void_ptr()
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
index 7c00109d0e9..24efb3a2f2a 100644
--- a/rust/qemu-api/src/cell.rs
+++ b/rust/qemu-api/src/cell.rs
@@ -1023,3 +1023,34 @@ pub unsafe fn new() -> Self {
         }
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


