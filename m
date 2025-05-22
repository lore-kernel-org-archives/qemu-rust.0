Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uI12x-0007RN-74
	for mharc-qemu-rust@gnu.org; Thu, 22 May 2025 04:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uI12r-0007Ob-4f
 for qemu-rust@nongnu.org; Thu, 22 May 2025 04:12:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uI12n-0003Mh-Q6
 for qemu-rust@nongnu.org; Thu, 22 May 2025 04:12:52 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a35c894313so5117127f8f.2
 for <qemu-rust@nongnu.org>; Thu, 22 May 2025 01:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747901567; x=1748506367; darn=nongnu.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oRP6hFzjEnRw224aWEFGaLpYcpqN6JBOx/NBdDGoSLg=;
 b=KcEiik4zx08a9E/5FcxlzBybSVkW5wcg5AcLwmcrmQbnG/08F+e2l0wiF9JdkwWSc9
 BcTYI676GlKy8kfX+SLd6CYLFoCCrzYyXIIXj+/v9+KLGlhyO/8MDeCsuVzjZdufcOSJ
 Hx695D+s9Z5KK1OZKUMdlQlfF8yvFzb2OGZ2o50TcMjyc374z5+8CF6vZA8Q7Hv247aQ
 sXaIuOP7Mwsc2UwzkBsmvdH9SIbvidszJ9ElIu3So1baM7lporMk8AaKpnbwYOVj3vPN
 tJ4bz5ulrSgFDxaxbQmJdZ9kIUZqk4Qfu4aW98tB0W1oGKChD8s+IdMTq/wrbbJCllX7
 VteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747901567; x=1748506367;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oRP6hFzjEnRw224aWEFGaLpYcpqN6JBOx/NBdDGoSLg=;
 b=vwWL/Nn1YshFrFXj6h9XEvUGjJZjPiTyYu6TLWsaxKnOsQGRrm/tG2fu+/1lU4xv3p
 w1ClvlYniA8Q5kAbGwmifu9ojLoJAkcNyJMGB0Xr7S7adA4l3IvXRexshJq5u3xMvlVN
 kapyg96hsf+faL8aaQOX0YLDFrcg5XIQlaCvKCKKjuiQgdyA1IZrBQFxuLpEcCmfyWzL
 D83I/QxED/eWIpCKCY7k55SbVPJriN+7irdB6OPwULqjGn5N9MkwuLj1ReOCbJREAOev
 gtR0AMshwp5417wcNdE3t6ZBDqwdmfRWp125ZQdrwC6uVHZzw5OIMcRdU7gmP3D0yqFw
 F+rg==
X-Gm-Message-State: AOJu0YzRRIjxDllH9XUIZB1rbt/yF9Kek++oNSOlzTSqTRvfuklBX5Uy
 psrJ7Joi1oNGpFWX17uSundShr6CFOsXdBLidfekNmMRDuZPBTkyDceyQauatHNADn0=
X-Gm-Gg: ASbGncsqlbhC93bkf9R09tFdim4Hc//k0DIeuwniMq672GXX3ci+gJAaZrbRrdiBT/j
 2UToRjL/Vd4T195TtPgDmquXJZFiO4f10Hbwx7FBySyD6hbu80iu1TwZWdgcWjsY2sGQ9WHo4uw
 /ex1XvJos9JqhCz61YqVlWwwr6ypxNe2YeHTeKwo9ggxtXcCKW/Ue4Rqh0gXOQzO5iswKIh7sT0
 5DU0pEFjPVDQ6zWxb+zlWI7KCTN5E3wwoKLGJfabUuEBai/vr/2ZdwoIlubf/fTQi0RyFenTCYd
 a+pRZ23uADFII7QN0c1Ox+qru9o82PX8VLWwNIHKSITwHh4//5QgiAkbSQhTG3hKa0YkhBvR11p
 /FIIq06mTPw==
X-Google-Smtp-Source: AGHT+IHLW7PJoV4Kj8oI/e3oRVXUFm6kjsYTQdySN+Bu0fgIX8zuf6OtbngYiF8Nwz2m9vtV3O/Mcg==
X-Received: by 2002:a05:6000:2012:b0:39e:cbe1:8d68 with SMTP id
 ffacd0b85a97d-3a35c80923dmr22168778f8f.6.1747901567023; 
 Thu, 22 May 2025 01:12:47 -0700 (PDT)
Received: from [127.0.1.1] (adsl-1.37.6.162.tellas.gr. [37.6.162.1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca208besm22159584f8f.0.2025.05.22.01.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 01:12:46 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 22 May 2025 11:12:30 +0300
Subject: [PATCH WIP RFC] rust: add qdev DeviceProperties derive macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250522-rust-qdev-properties-v1-1-5b18b218bad1@linaro.org>
X-B4-Tracking: v=1; b=H4sIAG3cLmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyMj3aLS4hLdwpTUMt2CovyC1KISoG5dcyOLVIs0s0QTM4tUJaDWgqL
 UtMwKsLHRSuGeASCxIDdnpdjaWgDzByU6cgAAAA==
X-Change-ID: 20250522-rust-qdev-properties-728e8f6a468e
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17152;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=6uvIlwwVxcMvDdJyIjn1Iy83OnEKAKozLbBUQB1YoBo=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9MdHg5SHprb2FSOW1vdjc5QWE5czR2bTVpbTN5CjFsWjR0bmRqdnZnOUxlOGxY
 YU9KQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUM3Y2ZRQUt
 DUkIzS2Nkd2YzNEowQ2J6RUFDYTdFaEdaTzYzTkdlNVlRZGE1N1g2cTVVQUFUcDhGQW9Rc1J2Vw
 pobllQTTFRMFNwbm9WZmJaMGtWcmlGRWxnT3c2TXFMeFZ6QUtEQURpVW5wb1JlWnMxUlNXQ2dkY
 VNwa0x5Q0E3CmViMExaUnNyWXVrcWxydmNFa09wUmVyM0tjYi90ajl5dVcrQVBNNnczbVdJREdB
 Z3FPeW1NVlN1NnBVK0tkODIKaXNFRjNJdWZtZkp5eHpTdkNadUpQM0dmcWZZbFZLSVVTSE5vSHF
 WQ2ZmcVVDMzF6Q2pyWnE0UDFuTDJvbm5MQgp6VEI4Q0dNdk01VUczN0FBeEQwTzFjb1JsODlBNH
 BleHF6K0c2dnRVZTRaMlM2eVdnWlJiMkswbmNoVW1Ic1lDCkJGejZWVXZnaUxOaVJZM0hXMzNyW
 DJCNUVCR3lJeVJKa0NibmdXeWpJTXlXWFVraHFQaE9zZFJtbldzQVoxZzgKaU1GSnhpczFtMVNH
 eWkzVDY1cFVPOVdHMFh2dHRNajVGQUUwMGlybEVEa3FFMW9OZ1VLVngzYWZXK0VkcW91TwpSa0M
 5TUFwVzlkUXBOTGFNVldQN1MzNGtDQkZiRE8vY2Q5NEpXN2dsUU1oY2l5R1F4S1Q5NGIyUGg1Mj
 lIdlNNCkRBNzZwVFFCZEh4S3dzZnFhSmtCWlBoZEhyU2FodllyTTgzYWpoaURXdDJRd1NGc21YW
 jl1M0E3blBJWGhBc28KdzZoUGtiYUQ1clJod2luWGFhcmY3QU9kVy8rN3V6NWxSV0o3bEFJWVc2
 NFAvSWM0bzZEK3RKMnZaektHMlJDNQpZRUJ5djkyNGVuWWV2K2QyN3R6b1lpaStnZHM1NjRPT2h
 5TE9aSU9USmhScHNXNldiYlRFUitWeGZtdTk2a2RnCmR5SmpqUT09Cj1FV29QCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 22 May 2025 08:12:54 -0000

Add derive macro for declaring qdev properties directly above the field
definitions. To do this, we split DeviceImpl::properties method on a
separate trait so we can implement only that part in the derive macro
expansion (we cannot partially implement the DeviceImpl trait).

Adding a `property` attribute above the field declaration will generate
a `qemu_api::bindings::Property` array member in the device's property
list.

As a proof of concept, I added a typed alias for booleans,
`bool_property` that allows you to skip specifying qdev_prop_bool.

This is unnecessary though, because once we have the
const_refs_to_static feature we can introduce a QdevProp trait that
returns a reference to a type's qdev_prop_* global variable. We cannot
do this now because for our minimum Rust version we cannot refer to
statics from const values.

It'd look like this:

  pub trait QDevProp {
    const VALUE: &'static bindings::PropertyInfo;
  }

  impl QDevProp for bool {
    const VALUE: &'static bindings::PropertyInfo = unsafe {
      &bindings::qdev_prop_bool };
  }

  impl QDevProp for u64 {
    const VALUE: &'static bindings::PropertyInfo = unsafe {
      &bindings::qdev_prop_uint64 };
  }

  // etc.. for all basic types

So, this patch is not for merging yet, I will wait until we upgrade the
Rust version and re-spin it with a proper trait-based implementation (and
also split it into individual steps/patches).

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 rust/hw/char/pl011/src/device.rs       |  13 +--
 rust/hw/char/pl011/src/device_class.rs |  26 +-----
 rust/hw/timer/hpet/src/hpet.rs         |   4 +-
 rust/qemu-api-macros/src/lib.rs        | 157 ++++++++++++++++++++++++++++++++-
 rust/qemu-api/src/qdev.rs              |  22 +++--
 rust/qemu-api/tests/tests.rs           |   9 +-
 6 files changed, 187 insertions(+), 44 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index bde3be65c5b0d9dbb117407734d93fff577ddecf..e22f5421dc5d9cd5c6fa8b11ab746e5c254bdb37 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -10,7 +10,10 @@
     irq::{IRQState, InterruptSource},
     memory::{hwaddr, MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder},
     prelude::*,
-    qdev::{Clock, ClockEvent, DeviceImpl, DeviceState, Property, ResetType, ResettablePhasesImpl},
+    qdev::{
+        Clock, ClockEvent, DeviceImpl, DevicePropertiesImpl, DeviceState, ResetType,
+        ResettablePhasesImpl,
+    },
     qom::{ObjectImpl, Owned, ParentField},
     static_assert,
     sysbus::{SysBusDevice, SysBusDeviceImpl},
@@ -98,12 +101,13 @@ pub struct PL011Registers {
 }
 
 #[repr(C)]
-#[derive(qemu_api_macros::Object)]
+#[derive(qemu_api_macros::Object, qemu_api_macros::DeviceProperties)]
 /// PL011 Device Model in QEMU
 pub struct PL011State {
     pub parent_obj: ParentField<SysBusDevice>,
     pub iomem: MemoryRegion,
     #[doc(alias = "chr")]
+    #[property(name = c"chardev", qdev_prop = qemu_api::bindings::qdev_prop_chr)]
     pub char_backend: CharBackend,
     pub regs: BqlRefCell<PL011Registers>,
     /// QEMU interrupts
@@ -122,6 +126,7 @@ pub struct PL011State {
     #[doc(alias = "clk")]
     pub clock: Owned<Clock>,
     #[doc(alias = "migrate_clk")]
+    #[bool_property(name = c"migrate-clk", default = true)]
     pub migrate_clock: bool,
 }
 
@@ -169,9 +174,6 @@ impl ObjectImpl for PL011State {
 }
 
 impl DeviceImpl for PL011State {
-    fn properties() -> &'static [Property] {
-        &device_class::PL011_PROPERTIES
-    }
     fn vmsd() -> Option<&'static VMStateDescription> {
         Some(&device_class::VMSTATE_PL011)
     }
@@ -703,6 +705,7 @@ impl PL011Impl for PL011Luminary {
     const DEVICE_ID: DeviceId = DeviceId(&[0x11, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1]);
 }
 
+impl DevicePropertiesImpl for PL011Luminary {}
 impl DeviceImpl for PL011Luminary {}
 impl ResettablePhasesImpl for PL011Luminary {}
 impl SysBusDeviceImpl for PL011Luminary {}
diff --git a/rust/hw/char/pl011/src/device_class.rs b/rust/hw/char/pl011/src/device_class.rs
index d328d846323f6080a9573053767e51481eb32941..83d70d7d82aac4a3252a0b4cb24af705b01d3635 100644
--- a/rust/hw/char/pl011/src/device_class.rs
+++ b/rust/hw/char/pl011/src/device_class.rs
@@ -8,11 +8,8 @@
 };
 
 use qemu_api::{
-    bindings::{qdev_prop_bool, qdev_prop_chr},
-    prelude::*,
-    vmstate::VMStateDescription,
-    vmstate_clock, vmstate_fields, vmstate_of, vmstate_struct, vmstate_subsections, vmstate_unused,
-    zeroable::Zeroable,
+    prelude::*, vmstate::VMStateDescription, vmstate_clock, vmstate_fields, vmstate_of,
+    vmstate_struct, vmstate_subsections, vmstate_unused, zeroable::Zeroable,
 };
 
 use crate::device::{PL011Registers, PL011State};
@@ -82,22 +79,3 @@ extern "C" fn pl011_post_load(opaque: *mut c_void, version_id: c_int) -> c_int {
     },
     ..Zeroable::ZERO
 };
-
-qemu_api::declare_properties! {
-    PL011_PROPERTIES,
-    qemu_api::define_property!(
-        c"chardev",
-        PL011State,
-        char_backend,
-        unsafe { &qdev_prop_chr },
-        CharBackend
-    ),
-    qemu_api::define_property!(
-        c"migrate-clk",
-        PL011State,
-        migrate_clock,
-        unsafe { &qdev_prop_bool },
-        bool,
-        default = true
-    ),
-}
diff --git a/rust/hw/timer/hpet/src/hpet.rs b/rust/hw/timer/hpet/src/hpet.rs
index 779681d650998291f138e8cc61807612b8597961..21ebcfc9f22f8f5463812db218a1dc2039eda75b 100644
--- a/rust/hw/timer/hpet/src/hpet.rs
+++ b/rust/hw/timer/hpet/src/hpet.rs
@@ -1033,11 +1033,13 @@ impl ObjectImpl for HPETState {
     ..Zeroable::ZERO
 };
 
-impl DeviceImpl for HPETState {
+impl qemu_api::qdev::DevicePropertiesImpl for HPETState {
     fn properties() -> &'static [Property] {
         &HPET_PROPERTIES
     }
+}
 
+impl DeviceImpl for HPETState {
     fn vmsd() -> Option<&'static VMStateDescription> {
         Some(&VMSTATE_HPET)
     }
diff --git a/rust/qemu-api-macros/src/lib.rs b/rust/qemu-api-macros/src/lib.rs
index f97449bb304b575c7d8c3272f287a81a9f8c9131..c5b746198d183d214526c8f0132b23d375e2d27b 100644
--- a/rust/qemu-api-macros/src/lib.rs
+++ b/rust/qemu-api-macros/src/lib.rs
@@ -3,10 +3,11 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 use proc_macro::TokenStream;
-use quote::quote;
+use quote::{quote, quote_spanned, ToTokens};
 use syn::{
-    parse_macro_input, parse_quote, punctuated::Punctuated, spanned::Spanned, token::Comma, Data,
-    DeriveInput, Field, Fields, FieldsUnnamed, Ident, Meta, Path, Token, Variant,
+    parse::Parse, parse_macro_input, parse_quote, punctuated::Punctuated, spanned::Spanned,
+    token::Comma, Data, DeriveInput, Field, Fields, FieldsUnnamed, Ident, Meta, Path, Token,
+    Variant,
 };
 
 mod utils;
@@ -143,6 +144,156 @@ pub const fn raw_get(slot: *mut Self) -> *mut <Self as crate::cell::Wrapper>::Wr
     })
 }
 
+#[derive(Debug)]
+struct DeviceProperty {
+    name: Option<syn::LitCStr>,
+    qdev_prop: Option<syn::Path>,
+    assert_type: Option<proc_macro2::TokenStream>,
+    bitnr: Option<syn::Expr>,
+    defval: Option<syn::Expr>,
+}
+
+impl Parse for DeviceProperty {
+    fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
+        let _: syn::Token![#] = input.parse()?;
+        let bracketed;
+        _ = syn::bracketed!(bracketed in input);
+        let attribute = bracketed.parse::<syn::Ident>()?.to_string();
+        let (assert_type, qdev_prop) = match attribute.as_str() {
+            "property" => (None, None),
+            "bool_property" => (
+                Some(quote! { bool }),
+                Some(syn::parse2(
+                    quote! { ::qemu_api::bindings::qdev_prop_bool },
+                )?),
+            ),
+            other => unreachable!("Got unexpected DeviceProperty attribute `{}`", other),
+        };
+        let mut retval = Self {
+            name: None,
+            qdev_prop,
+            assert_type,
+            bitnr: None,
+            defval: None,
+        };
+        let content;
+        _ = syn::parenthesized!(content in bracketed);
+        while !content.is_empty() {
+            let value: syn::Ident = content.parse()?;
+            if value == "name" {
+                let _: syn::Token![=] = content.parse()?;
+                if retval.name.is_some() {
+                    panic!("`name` can only be used at most once");
+                }
+                retval.name = Some(content.parse()?);
+            } else if value == "qdev_prop" {
+                let _: syn::Token![=] = content.parse()?;
+                if retval.assert_type.is_some() {
+                    // qdev_prop will be Some(_), but we want to print a helpful error message
+                    // explaining why you should use #[property(...)] instead of saying "you
+                    // defined qdev_prop twice".
+                    panic!("Use `property` attribute instead of `{attribute}` if you want to override `qdev_prop` value.");
+                }
+                if retval.qdev_prop.is_some() {
+                    panic!("`qdev_prop` can only be used at most once");
+                }
+                retval.qdev_prop = Some(content.parse()?);
+            } else if value == "bitnr" {
+                let _: syn::Token![=] = content.parse()?;
+                if retval.bitnr.is_some() {
+                    panic!("`bitnr` can only be used at most once");
+                }
+                retval.bitnr = Some(content.parse()?);
+            } else if value == "default" {
+                let _: syn::Token![=] = content.parse()?;
+                if retval.defval.is_some() {
+                    panic!("`default` can only be used at most once");
+                }
+                retval.defval = Some(content.parse()?);
+            } else {
+                panic!("unrecognized field `{value}`");
+            }
+
+            if !content.is_empty() {
+                let _: syn::Token![,] = content.parse()?;
+            }
+        }
+        Ok(retval)
+    }
+}
+
+#[proc_macro_derive(DeviceProperties, attributes(property, bool_property))]
+pub fn derive_device_properties(input: TokenStream) -> TokenStream {
+    let span = proc_macro::Span::call_site();
+    let input = parse_macro_input!(input as DeriveInput);
+    let properties: Vec<(syn::Field, proc_macro2::Span, DeviceProperty)> = match input.data {
+        syn::Data::Struct(syn::DataStruct {
+            fields: syn::Fields::Named(fields),
+            ..
+        }) => fields
+            .named
+            .iter()
+            .flat_map(|f| {
+                f.attrs
+                    .iter()
+                    .filter(|a| a.path().is_ident("property") || a.path().is_ident("bool_property"))
+                    .map(|a| {
+                        (
+                            f.clone(),
+                            f.span(),
+                            syn::parse(a.to_token_stream().into())
+                                .expect("could not parse property attr"),
+                        )
+                    })
+            })
+            .collect::<Vec<_>>(),
+        _other => unreachable!(),
+    };
+    let name = &input.ident;
+
+    let mut assertions = vec![];
+    let mut properties_expanded = vec![];
+    let zero = syn::Expr::Verbatim(quote! { 0 });
+    for (field, field_span, prop) in properties {
+        let prop_name = prop.name.as_ref().unwrap();
+        let field_name = field.ident.as_ref().unwrap();
+        let qdev_prop = prop.qdev_prop.as_ref().unwrap();
+        let bitnr = prop.bitnr.as_ref().unwrap_or(&zero);
+        let set_default = prop.defval.is_some();
+        let defval = prop.defval.as_ref().unwrap_or(&zero);
+        if let Some(assert_type) = prop.assert_type {
+            assertions.push(quote_spanned! {field_span=>
+                ::qemu_api::assert_field_type! ( #name, #field_name, #assert_type );
+            });
+        }
+        properties_expanded.push(quote_spanned! {field_span=>
+            ::qemu_api::bindings::Property {
+                // use associated function syntax for type checking
+                name: ::std::ffi::CStr::as_ptr(#prop_name),
+                info: unsafe { &#qdev_prop },
+                offset: ::core::mem::offset_of!(#name, #field_name) as isize,
+                bitnr: #bitnr,
+                set_default: #set_default,
+                defval: ::qemu_api::bindings::Property__bindgen_ty_1 { u: #defval as u64 },
+                ..::qemu_api::zeroable::Zeroable::ZERO
+            }
+        });
+    }
+    let properties_expanded = quote_spanned! {span.into()=>
+        #(#assertions)*
+
+        impl ::qemu_api::qdev::DevicePropertiesImpl for #name {
+            fn properties() -> &'static [::qemu_api::bindings::Property] {
+                static PROPERTIES: &'static [::qemu_api::bindings::Property] = &[#(#properties_expanded),*];
+
+                PROPERTIES
+            }
+        }
+    };
+
+    TokenStream::from(properties_expanded)
+}
+
 #[proc_macro_derive(Wrapper)]
 pub fn derive_opaque(input: TokenStream) -> TokenStream {
     let input = parse_macro_input!(input as DeriveInput);
diff --git a/rust/qemu-api/src/qdev.rs b/rust/qemu-api/src/qdev.rs
index 1279d7a58d50e1bf6c8d2e6f00d7229bbb19e003..2fd8b2750ffabcaa1065558d38a700e35fbc9136 100644
--- a/rust/qemu-api/src/qdev.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -100,8 +100,19 @@ pub trait ResettablePhasesImpl {
     T::EXIT.unwrap()(unsafe { state.as_ref() }, typ);
 }
 
+pub trait DevicePropertiesImpl {
+    /// An array providing the properties that the user can set on the
+    /// device.  Not a `const` because referencing statics in constants
+    /// is unstable until Rust 1.83.0.
+    fn properties() -> &'static [Property] {
+        &[]
+    }
+}
+
 /// Trait providing the contents of [`DeviceClass`].
-pub trait DeviceImpl: ObjectImpl + ResettablePhasesImpl + IsA<DeviceState> {
+pub trait DeviceImpl:
+    ObjectImpl + ResettablePhasesImpl + DevicePropertiesImpl + IsA<DeviceState>
+{
     /// _Realization_ is the second stage of device creation. It contains
     /// all operations that depend on device properties and can fail (note:
     /// this is not yet supported for Rust devices).
@@ -110,13 +121,6 @@ pub trait DeviceImpl: ObjectImpl + ResettablePhasesImpl + IsA<DeviceState> {
     /// with the function pointed to by `REALIZE`.
     const REALIZE: Option<fn(&Self)> = None;
 
-    /// An array providing the properties that the user can set on the
-    /// device.  Not a `const` because referencing statics in constants
-    /// is unstable until Rust 1.83.0.
-    fn properties() -> &'static [Property] {
-        &[]
-    }
-
     /// A `VMStateDescription` providing the migration format for the device
     /// Not a `const` because referencing statics in constants is unstable
     /// until Rust 1.83.0.
@@ -171,7 +175,7 @@ pub fn class_init<T: DeviceImpl>(&mut self) {
         if let Some(vmsd) = <T as DeviceImpl>::vmsd() {
             self.vmsd = vmsd;
         }
-        let prop = <T as DeviceImpl>::properties();
+        let prop = <T as DevicePropertiesImpl>::properties();
         if !prop.is_empty() {
             unsafe {
                 bindings::device_class_set_props_n(self, prop.as_ptr(), prop.len());
diff --git a/rust/qemu-api/tests/tests.rs b/rust/qemu-api/tests/tests.rs
index a658a49fcfdda8fa4b9d139c10afb6ff3243790b..e8eadfd6e9add385ffc97de015b84aae825c18ee 100644
--- a/rust/qemu-api/tests/tests.rs
+++ b/rust/qemu-api/tests/tests.rs
@@ -9,7 +9,7 @@
     cell::{self, BqlCell},
     declare_properties, define_property,
     prelude::*,
-    qdev::{DeviceImpl, DeviceState, Property, ResettablePhasesImpl},
+    qdev::{DeviceImpl, DevicePropertiesImpl, DeviceState, Property, ResettablePhasesImpl},
     qom::{ObjectImpl, ParentField},
     sysbus::SysBusDevice,
     vmstate::VMStateDescription,
@@ -68,10 +68,13 @@ impl ObjectImpl for DummyState {
 
 impl ResettablePhasesImpl for DummyState {}
 
-impl DeviceImpl for DummyState {
+impl DevicePropertiesImpl for DummyState {
     fn properties() -> &'static [Property] {
         &DUMMY_PROPERTIES
     }
+}
+
+impl DeviceImpl for DummyState {
     fn vmsd() -> Option<&'static VMStateDescription> {
         Some(&VMSTATE)
     }
@@ -85,6 +88,8 @@ pub struct DummyChildState {
 
 qom_isa!(DummyChildState: Object, DeviceState, DummyState);
 
+impl DevicePropertiesImpl for DummyChildState {}
+
 pub struct DummyChildClass {
     parent_class: <DummyState as ObjectType>::Class,
 }

---
base-commit: 2af4a82ab2cce3412ffc92cd4c96bd870e33bc8e
change-id: 20250522-rust-qdev-properties-728e8f6a468e

--
γαῖα πυρί μιχθήτω


