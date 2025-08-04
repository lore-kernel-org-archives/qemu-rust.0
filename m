Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078FBC87FCF
	for <qemu-rust@archiver.kernel.org>; Mon,  4 Aug 2025 15:18:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uiww4-0004C7-4U; Mon, 04 Aug 2025 11:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uivXQ-0005i6-G3
 for qemu-rust@nongnu.org; Mon, 04 Aug 2025 09:47:40 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uivXO-0002ZM-CZ
 for qemu-rust@nongnu.org; Mon, 04 Aug 2025 09:47:40 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-60bfcada295so5375162a12.1
 for <qemu-rust@nongnu.org>; Mon, 04 Aug 2025 06:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754315257; x=1754920057; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NnAVSdr5SadLRV4G+KyJ3baz4qmfkMEOYJh7lQrhK5M=;
 b=noWRV0CiNNYuSlX4O31qhxM/4U6hPcK6Z0QoBqFpkBgsxh8VdoQmUjFq9VZXwPYdwP
 DhF1Ir3bwsVY50lMbhuNuFh1rRzoNW9axLfyBL4NhpSys5AzyPaWwF0O2Wf7tLr5zPQk
 QlxGyTspBPM6QnbiIvDEgrQsVm/mROh/o663Npwl4wRjA8DyVxTOiQPZOj7yAPzqr6/t
 PW7j2mj9Bk4wIh7qdqxOXqlQU/4Aw1ZVFFSuIy4trdlxGZzTCAgiXuwbrwXq6J5hjmqK
 mNRJ+VPGKMd9WSAkkYK5JrRvcW/Jb2gFvbYAs+uiqoTsLH5uB9Asqcp5jBjbB93a5xlO
 MViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754315257; x=1754920057;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NnAVSdr5SadLRV4G+KyJ3baz4qmfkMEOYJh7lQrhK5M=;
 b=pnEhZJYBnJehOyj4OYsHlYS8bevjwc3SfD+YnH8/92SnFhmrinbayYYADj3QlILztG
 6bSlaCgg2PckiNnfrKRZw75Vh4v7tLiRRZAtBQyjWcizqFPuSInwLh5lBB2Y/wGQUs5g
 zaRXirmq3xYaMGXzj5A/XL3q1kIxZVC9ZX2tlttry4h9pr5FGB3mThrx9VQi7Mt3J6Yd
 GtQa+MOS0mJudlbz2ZVE3XwLhAPFOHcX34JeJk5Y3E+RVr94opuOeiwRbm/fsv+eGeHm
 +rL8Ofjc6T9cPQBtIfiyLoLjXVE4way2n57nuo9UG9T6UaqKz8KVdtrzHLVUiUVQOSdI
 lK4w==
X-Gm-Message-State: AOJu0YzVSfbutObNHPaQ/188twkbLTN6lueKY18DL/ZELH7NiVBLrFLg
 OkmdhQwE7B7XOn4IplSa+rzQ3ujXiWnikxztyY+WzPhz4zuzhtA1L9/5ZKT27MvmlIE=
X-Gm-Gg: ASbGncs9gP4W3U5+du68x4LbFXhP68Q0GA4eXV61Du4ITmAa+6IsN3kDja5QYoalOqa
 f/WqTgrhMu93cy0ePWoIe0sTHCN+DgryPc9cO1N2w8w8SwiUsqkyT1mzUI9ry6HZDYKdFgZ4xhm
 tysGCx3gKbpqTNo6Bf1ZGMNTJFpn6AgLOSo9AZdIFqWqhljsExqDxq2h+7mSIX5bRUMfjW0jpcq
 9l2ek3sepONLv5cvroYQbnPkgV0vSjcE9LSe5nOqw0va5t+5CNQGDKoQs4+sPiibgasWsv8U3lH
 jo4htigUNmkDismcaO+boOvbKCrtLnrpR+5MzKyMKGuF+1JPgd1iSAcmhT7+1qohk8as+kjOsBQ
 umfMBERAor7+a4ve1GZlgr/JUn7GKkoBPOYn1vOnvunFFcZbnOFqhjFOgt2pnpT0GuBs=
X-Google-Smtp-Source: AGHT+IGKo06pwhWODnr5gkKxMD1RT/ZXgok8or+fPM5MM8mauBOygXPm6upve6vIUfWe9JiSyfWWPA==
X-Received: by 2002:a05:6402:2747:b0:612:b24f:4b2f with SMTP id
 4fb4d7f45d1cf-615e738820fmr8636539a12.27.1754315256733; 
 Mon, 04 Aug 2025 06:47:36 -0700 (PDT)
Received: from [127.0.1.1] (athedsl-4441708.home.otenet.gr. [79.129.182.92])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f15d9fsm6850590a12.17.2025.08.04.06.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 06:47:36 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 04 Aug 2025 16:47:16 +0300
Subject: [PATCH RFC 3/5] rust/qemu-api-macros: Add #[trace_events] macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-rust_trace-v1-3-b20cc16b0c51@linaro.org>
References: <20250804-rust_trace-v1-0-b20cc16b0c51@linaro.org>
In-Reply-To: <20250804-rust_trace-v1-0-b20cc16b0c51@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 alex.bennee@linaro.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6514;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=k9Sqif8zYxdtUR9QlMnRMv0bMeNFqRXvKJG0mBE63lg=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9rTG56SnJwOEdCaTljWjZQeWtnbGR3b3FWaVUzCmJkaExKREtjNU5jKzY2M2Ju
 L3FKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUpDNTh3QUt
 DUkIzS2Nkd2YzNEowQjVhRC9vQzJwUG5LVnhKcEZsT1dMWGkwRUE1R3J2eFdYbDJrcUc3V1MxbQ
 pITVZPRmk4TWw5S2hpWndsWDA4YndWNlplM3FKd204b1IxRnZERm1TajJHdDhFMGFkNE5xNEIyU
 FRUbVZKL1FpCnJ0ZjRET2tUSUdsZ0FyYVp3bXNmZ0UzSCt1L2VSb3Q4Y01YUGhveFhLc2E1ejM2
 ZlFqVU1wK3ZESklNK1RibnUKY1dnc01LZ24vL1ZUdlVxcnRsZFF2YlcyVjBkTEwzMkQ1cW5VM3h
 IREhsZGticDRWL1p2VHJ5RENteTVaTU9RQwpvbHQ4eTE0S25RdGNTK0luY0ZOVlo2azNUNEk4Ri
 tibFREdEZhb2JrTVV0NVJkQk1CUWZSM29qTVAxOHdSdDlDCmZJSzVjWjNNWStkbGJmV0pTYUo4U
 FhSVGVZOW44dUtNakE2bFRDZHFadFRLeWtKY3JxeGtycG9qK2xpbkJ3elEKNEhGeVBSUGJqcUhI
 ZTdsMUNFOEFPdmN6YjJCazN1UU0rWXFKbDV4MWhLV2xmQyttYlJYQkdDbmg3MDRxNXlxWQpONjJ
 sQUFYZmVTT1hOMmJRUk5VbkRDMmdnbURzc0cxYlJXbFdLNXVFYjFicjRzNnBSU09EKzBZNVFOMH
 dldEl2CisxcWtmeFB6R0kzSFRudlBDWTFlQktnSVJ3U2dHWWJGUVdVSmlLR0hxSzQ0TmpBVVJ5Z
 TI4cHdsdEZlcEJHVDkKNm9WL1pGZGlneUs5YW1XaW5ac2RTVkFGTnZ0OFNjcVNzaytmYUxEWHNs
 djBPdkd5d1BCcXl6V1hIdll3NkdiYQpFVUNCQldaN0p6cVZpRWovTXBLZlJqU3NtODlvYWs5UkZ
 hd0QySXVzaHg2QVg3MlVlQnorNzZJNzluWDd6TFNZCllEQ1kzQT09Cj1KQlNLCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x532.google.com
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

WIP

Add attribute macro that converts a module definition into trace events.

Currently it allocates a string to pass to
::qemu_api::log::LogGuard::log_fmt. If you pass format_args! directly
the arguments are not properly written, might be a bug in the
qemu_api::log implementation.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 rust/qemu-api-macros/src/lib.rs | 140 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 137 insertions(+), 3 deletions(-)

diff --git a/rust/qemu-api-macros/src/lib.rs b/rust/qemu-api-macros/src/lib.rs
index b525d89c09e496a1f7f5582dc6d994e318f62bca..7d13b1c195085f1d153514cc01ec5c389160916a 100644
--- a/rust/qemu-api-macros/src/lib.rs
+++ b/rust/qemu-api-macros/src/lib.rs
@@ -3,10 +3,15 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 use proc_macro::TokenStream;
-use quote::quote;
+use quote::{format_ident, quote};
 use syn::{
-    parse_macro_input, parse_quote, punctuated::Punctuated, spanned::Spanned, token::Comma, Data,
-    DeriveInput, Error, Field, Fields, FieldsUnnamed, Ident, Meta, Path, Token, Variant,
+    parse::{Parse, ParseStream},
+    parse_macro_input, parse_quote,
+    punctuated::Punctuated,
+    spanned::Spanned,
+    token::Comma,
+    Data, DeriveInput, Error, Field, Fields, FieldsUnnamed, FnArg, Ident, LitCStr, LitStr, Meta,
+    Path, Token, Variant,
 };
 mod bits;
 use bits::BitsConstInternal;
@@ -263,3 +268,132 @@ pub fn bits_const_internal(ts: TokenStream) -> TokenStream {
         .unwrap_or_else(syn::Error::into_compile_error)
         .into()
 }
+
+#[derive(Debug)]
+struct TraceModule {
+    module_name: syn::Ident,
+    trace_events: Vec<(proc_macro2::TokenStream, syn::Ident)>,
+}
+
+impl Parse for TraceModule {
+    fn parse(input: ParseStream) -> syn::Result<Self> {
+        if input.peek(Token![pub]) {
+            input.parse::<Token![pub]>()?;
+        }
+        input.parse::<Token![mod]>()?;
+        let module_name: Ident = input.parse()?;
+        let braced;
+        _ = syn::braced!(braced in input);
+        let mut trace_events = vec![];
+        while !braced.is_empty() {
+            braced.parse::<Token![fn]>()?;
+            let name = braced.parse::<Ident>()?;
+            let name_cstr = LitCStr::new(
+                &std::ffi::CString::new(name.to_string()).unwrap(),
+                name.span(),
+            );
+            let name_cstr_ident = format_ident!("trace_{name}_name");
+            let arguments_inner;
+            _ = syn::parenthesized!(arguments_inner in braced);
+            let fn_arguments: Punctuated<FnArg, Token![,]> =
+                Punctuated::parse_terminated(&arguments_inner)?;
+            let body;
+            _ = syn::braced!(body in braced);
+            let trace_event_format_str: LitStr = body.parse()?;
+            assert!(body.is_empty(), "{body:?}");
+
+            let trace_macro_ident = format_ident!("trace_{name}");
+            let name_ident = format_ident!("trace_{name}_EVENT");
+            let dstate = format_ident!("TRACE_{name}_DSTATE");
+            let enabled = format_ident!("TRACE_{name}_ENABLED");
+            trace_events.push(
+                (
+                    quote! {
+                        static mut #dstate: u16 = 0;
+                        const #enabled: bool = true;
+                        const #name_cstr_ident: &::std::ffi::CStr = #name_cstr;
+
+                        static mut #name_ident: ::qemu_api::bindings::TraceEvent = ::qemu_api::bindings::TraceEvent {
+                            id: 0,
+                            name: #name_cstr_ident.as_ptr(),
+                            sstate: #enabled,
+                            dstate: &raw mut #dstate,
+                        };
+
+                        macro_rules! #trace_macro_ident {
+                            ($($args:tt)*) => {{
+                                crate::#module_name::#name($($args)*);
+                            }};
+                        }
+                        pub(crate) use #trace_macro_ident;
+
+                        pub fn #name(#fn_arguments) {
+                            if #enabled
+                                && unsafe { ::qemu_api::bindings::trace_events_enabled_count > 0 }
+                            && unsafe { #dstate > 0 }
+                            && unsafe {
+                                (::qemu_api::bindings::qemu_loglevel & (::qemu_api::log::Log::Trace as std::os::raw::c_int)) != 0
+                            } {
+                                _ = ::qemu_api::log::LogGuard::log_fmt(
+                                    format_args!("{}", format!("{} {}\n", stringify!(#name), format_args!(#trace_event_format_str)))
+                                );
+                            }
+                        }
+                    },
+                    name_ident,
+                )
+            );
+        }
+
+        Ok(Self {
+            module_name,
+            trace_events,
+        })
+    }
+}
+
+#[proc_macro_attribute]
+pub fn trace_events(_attr: TokenStream, item: TokenStream) -> TokenStream {
+    let input = parse_macro_input!(item as TraceModule);
+    let TraceModule {
+        module_name,
+        trace_events,
+    } = input;
+    let mut event_names = quote! {};
+    let mut trace_event_impl = quote! {};
+    let tracevents_len = trace_events.len() + 1;
+    for (body, event_name) in trace_events {
+        event_names = quote! {
+            #event_names
+            &raw mut #event_name,
+        };
+        trace_event_impl = quote! {
+            #trace_event_impl
+            #body
+        };
+    }
+
+    quote! {
+        #[macro_use]
+        mod #module_name {
+            #![allow(static_mut_refs)]
+            #![allow(non_upper_case_globals)]
+
+            #trace_event_impl
+
+            #[used]
+            static mut TRACE_EVENTS: [*mut ::qemu_api::bindings::TraceEvent; #tracevents_len] = unsafe {
+                [
+                    #event_names
+                    ::core::ptr::null_mut(),
+                ]
+            };
+
+            ::qemu_api::module_init!(
+                MODULE_INIT_TRACE => unsafe {
+                    ::qemu_api::bindings::trace_event_register_group(TRACE_EVENTS.as_mut_ptr())
+                }
+            );
+        }
+    }.into()
+}

-- 
2.47.2


