Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BA5C83F1A
	for <qemu-rust@archiver.kernel.org>; Thu, 17 Jul 2025 06:47:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ucIOZ-0001Pk-4D; Thu, 17 Jul 2025 02:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ucI5w-0008O8-RH
 for qemu-rust@nongnu.org; Thu, 17 Jul 2025 02:28:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ucI5q-00087T-R7
 for qemu-rust@nongnu.org; Thu, 17 Jul 2025 02:27:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752733665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N4iEr+cNk1mlij6jwBXafMWcLDkNKM8oNL/AuVmjjjM=;
 b=a8YLRaR2cQSg+YZKN77IfCpMI6iLQkNG6mjYWI3RhaBXBHUU+T49wAHQpWY3pom/wrXEvK
 mQZvVSjjxpTuw6Enjt6NOWnG54ytuCOuN76ZRKueUID1CzH0f7vPMHuUXfAE+oo8TVajuj
 Bo/wMiz019SzkN8T5Z2x5zehZmRqOlI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-80e_pG1WNo-F2DeokzyFdw-1; Thu, 17 Jul 2025 02:27:42 -0400
X-MC-Unique: 80e_pG1WNo-F2DeokzyFdw-1
X-Mimecast-MFC-AGG-ID: 80e_pG1WNo-F2DeokzyFdw_1752733661
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43e9b0fd00cso3544305e9.0
 for <qemu-rust@nongnu.org>; Wed, 16 Jul 2025 23:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752733661; x=1753338461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N4iEr+cNk1mlij6jwBXafMWcLDkNKM8oNL/AuVmjjjM=;
 b=DfHPLfLsH42bcI108pOle5K52Mj+tPgmaejrCe6/o57nsBP3WtCf/WRRLMfNXsBwf+
 C+DbQKI03WugGpcWroojQ9BUxhb1trvYtseewa2SGJovHWReB2Yysdtj14Xvp/X5UWSk
 Vu6VpaKms9YNYCjAtE6LLRknU8o/PlJ5Mg2qOOkNSaQsrPUmYD1Nql9eqE2bbF1fzDzm
 J/jj8x5GVDWam8pwnyHkuDug5P9OfC+iv1nH/PLbUUIwazW8A1LVXo1oee0Wt3K3Tum6
 +L+eMTFZ9fg3KqBapyLyYP5iWIkWr1v5dKakrZucN5Zr5YnkRU0i6s+KM9tAZav7gmig
 D6eA==
X-Gm-Message-State: AOJu0YxQpDcfI0YMIfpCUPpQaUU3XDZIct+/SuWLgRabNvoX72IT6AYm
 EJvx6JFzlNORVJq5pWwnOxNvAwX9YZkZb7jCW5L4X3L9RhFt+OOpurLWPtSSj4qWvk0dL98i8ol
 0NN809mi79hVmFEIQRKgskUjalmyT9MDLvGfg/fDsILb4Exom2yp6TEY=
X-Gm-Gg: ASbGnctlv0lUvA3vQ0poWp+VIESA3t2gFo+ljWlo1Xn3XivjhrjIyEpmkWbUvXox40X
 5wROzvCDUQo3+Ma5UR4v01Bb270bcIfd38Tw6zqFviqWrQIQPjwQfr8vsurDh1LnByi5bk4cq6y
 pqzvvD+Qg/533//nUQFF4PlK1tP/YdxtqAkfyOyrsJTTrHomw1Tp76LhRgxuMav8iZsncFtvhst
 8zIk4CZwHtcgdUYVQqS3UCa361S0Xl/hNGRfm29Zhg+O4UfgukVpoo8VBDZ+Sg5Xlj63K87Z540
 TBGz0tzd9+ggegOraWwZfj3n/V8EjvYT58d5lLM3AdY=
X-Received: by 2002:a05:600c:6745:b0:456:f22:ca49 with SMTP id
 5b1f17b1804b1-4563449a16emr18017325e9.0.1752733661092; 
 Wed, 16 Jul 2025 23:27:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1XdPhCgnraxxi8qxxo8/12t8LAf8ivJMssB9G7xv1uNYfE0QS9/J0i1fsnRF4wH1Wmzq28g==
X-Received: by 2002:a05:600c:6745:b0:456:f22:ca49 with SMTP id
 5b1f17b1804b1-4563449a16emr18017075e9.0.1752733660617; 
 Wed, 16 Jul 2025 23:27:40 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.73.155])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e818525sm40539465e9.16.2025.07.16.23.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 23:27:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	manos.pitsidianakis@linaro.org
Subject: [PATCH 4/4] qemu-api-macros: switch #[property] parsing to use
 combinators
Date: Thu, 17 Jul 2025 08:27:27 +0200
Message-ID: <20250717062727.305466-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717062727.305466-1-pbonzini@redhat.com>
References: <20250717062727.305466-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q6IXlZd24BXL_YKBmVVsGSwD53JRy6oVy2Sk0avjuN4_1752733661
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

attrs is a simple crate that provides parser combinators for
attribute arguments.  Use it instead of a handwritten parser,
and adjust tests.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api-macros/src/lib.rs   | 84 +++++++++++--------------------
 rust/qemu-api-macros/src/tests.rs |  8 +--
 2 files changed, 35 insertions(+), 57 deletions(-)

diff --git a/rust/qemu-api-macros/src/lib.rs b/rust/qemu-api-macros/src/lib.rs
index a0a8d758bcc..b3d44da9300 100644
--- a/rust/qemu-api-macros/src/lib.rs
+++ b/rust/qemu-api-macros/src/lib.rs
@@ -3,11 +3,11 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 use proc_macro::TokenStream;
-use quote::{quote, quote_spanned, ToTokens};
+use quote::{quote, quote_spanned};
 use syn::{
-    parse::Parse, parse_macro_input, parse_quote, punctuated::Punctuated, spanned::Spanned,
-    token::Comma, Data, DeriveInput, Error, Field, Fields, FieldsUnnamed, Ident, Meta, Path, Token,
-    Variant,
+    parse::Parse, parse::ParseStream, parse_macro_input, parse_quote, punctuated::Punctuated,
+    spanned::Spanned, token::Comma, Attribute, Data, DeriveInput, Error, Field, Fields, FieldsUnnamed,
+    Ident, Meta, Path, Token, Variant,
 };
 mod bits;
 use bits::BitsConstInternal;
@@ -153,61 +153,37 @@ enum DevicePropertyName {
     Str(syn::LitStr),
 }
 
-#[derive(Debug)]
+impl Parse for DevicePropertyName {
+    fn parse(input: ParseStream<'_>) -> syn::Result<Self> {
+        let lo = input.lookahead1();
+        if lo.peek(syn::LitStr) {
+            Ok(Self::Str(input.parse()?))
+        } else if lo.peek(syn::LitCStr) {
+            Ok(Self::CStr(input.parse()?))
+        } else {
+            Err(lo.error())
+        }
+    }
+}
+
+#[derive(Default, Debug)]
 struct DeviceProperty {
     rename: Option<DevicePropertyName>,
     defval: Option<syn::Expr>,
 }
 
-impl Parse for DeviceProperty {
-    fn parse(input: syn::parse::ParseStream) -> syn::Result<Self> {
-        let _: syn::Token![#] = input.parse()?;
-        let bracketed;
-        _ = syn::bracketed!(bracketed in input);
-        let attribute = bracketed.parse::<syn::Ident>()?;
-        debug_assert_eq!(&attribute.to_string(), "property");
-        let mut retval = Self {
-            rename: None,
-            defval: None,
-        };
-        let content;
-        _ = syn::parenthesized!(content in bracketed);
-        while !content.is_empty() {
-            let value: syn::Ident = content.parse()?;
-            if value == "rename" {
-                let _: syn::Token![=] = content.parse()?;
-                if retval.rename.is_some() {
-                    return Err(syn::Error::new(
-                        value.span(),
-                        "`rename` can only be used at most once",
-                    ));
-                }
-                if content.peek(syn::LitStr) {
-                    retval.rename = Some(DevicePropertyName::Str(content.parse::<syn::LitStr>()?));
-                } else {
-                    retval.rename =
-                        Some(DevicePropertyName::CStr(content.parse::<syn::LitCStr>()?));
-                }
-            } else if value == "default" {
-                let _: syn::Token![=] = content.parse()?;
-                if retval.defval.is_some() {
-                    return Err(syn::Error::new(
-                        value.span(),
-                        "`default` can only be used at most once",
-                    ));
-                }
-                retval.defval = Some(content.parse()?);
-            } else {
-                return Err(syn::Error::new(
-                    value.span(),
-                    format!("unrecognized field `{value}`"),
-                ));
-            }
+impl DeviceProperty {
+    fn parse_from(&mut self, a: &Attribute) -> syn::Result<()> {
+        use attrs::{set, with, Attrs};
+        let mut parser = Attrs::new();
+        parser.once("rename", with::eq(set::parse(&mut self.rename)));
+        parser.once("default", with::eq(set::parse(&mut self.defval)));
+        a.parse_args_with(&mut parser)
+    }
 
-            if !content.is_empty() {
-                let _: syn::Token![,] = content.parse()?;
-            }
-        }
+    fn parse(a: &Attribute) -> syn::Result<Self> {
+        let mut retval = Self::default();
+        retval.parse_from(a)?;
         Ok(retval)
     }
 }
@@ -229,7 +205,7 @@ fn derive_device_or_error(input: DeriveInput) -> Result<proc_macro2::TokenStream
             f.attrs
                 .iter()
                 .filter(|a| a.path().is_ident("property"))
-                .map(|a| Ok((f.clone(), syn::parse2(a.to_token_stream())?)))
+                .map(|a| Ok((f.clone(), DeviceProperty::parse(&a)?)))
         })
         .collect::<Result<Vec<_>, Error>>()?;
     let name = &input.ident;
diff --git a/rust/qemu-api-macros/src/tests.rs b/rust/qemu-api-macros/src/tests.rs
index 0e5a5728908..3c056652666 100644
--- a/rust/qemu-api-macros/src/tests.rs
+++ b/rust/qemu-api-macros/src/tests.rs
@@ -60,7 +60,7 @@ struct DummyState {
                 migrate_clock: bool,
             }
         },
-        "unrecognized field `defalt`"
+        "Expected one of `default` or `rename`"
     );
     // Check that repeated attributes are not allowed:
     derive_compile_fail!(
@@ -73,7 +73,8 @@ struct DummyState {
                 migrate_clock: bool,
             }
         },
-        "`rename` can only be used at most once"
+        "Duplicate argument",
+        "Already used here",
     );
     derive_compile_fail!(
         derive_device_or_error,
@@ -85,7 +86,8 @@ struct DummyState {
                 migrate_clock: bool,
             }
         },
-        "`default` can only be used at most once"
+        "Duplicate argument",
+        "Already used here",
     );
     // Check that the field name is preserved when `rename` isn't used:
     derive_compile!(
-- 
2.50.1


