Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYsCq-0001bk-5Y
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 14:40:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCc-0001Xs-HX
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCa-0002CO-Pj
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737142819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fRcbdCPUwOzkxRo3DppX4d9hILrOyDu40de8lR3wnkQ=;
 b=Ep5KKITlBQVnlh8nX4Pw9pWIpc7k++91vNNfZfDAw2wFd9lpCHFeKNaQmiAjZ9IwU1wkgE
 yIfVq5uMwQ3mv2/CliUQ82oeS0Fso7jTdb6Vqxhx/xcE0PWruJbfbNNMw2tcUoXWiZqOTl
 5mtv330+P9YeTkDPpCbilTDQDlklmZU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-f6yrWCn0MfuywX5FKdNseg-1; Fri, 17 Jan 2025 14:40:18 -0500
X-MC-Unique: f6yrWCn0MfuywX5FKdNseg-1
X-Mimecast-MFC-AGG-ID: f6yrWCn0MfuywX5FKdNseg
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-aa68952272bso289569566b.2
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 11:40:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737142817; x=1737747617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fRcbdCPUwOzkxRo3DppX4d9hILrOyDu40de8lR3wnkQ=;
 b=bcwpqBCL4FXUbXBLvtNMWJOBpMCL1pL2dVUXAGFaJQLtdXtQeFfTktEP/NQGsVHbzc
 6SJZp62IpBHiF147okXFnpadRpTGkP5CXFhRPuFQ2fVt9HJtDon09qkTVAixnWP+Egai
 gbu9zXeYHeLnh9eBvAtaI441mPzbxxPAVcDyg64oKweKKQWlUJerRctteaPXdKBYNBai
 bVfzWCxDzSFooylCSd1RwaFIphCcBny+Il2PmDG3ZK2rpCixdcfSvKzVR4StzcN6eLWe
 v99PUFeZQFr6PCA7nfgQre8WH0YhrI5/t+KGbSidf5tRWH6/Tr2wT726ZntPZ8uJDDQZ
 bWCQ==
X-Gm-Message-State: AOJu0YzWZXlZRugNb6oNlwueFpQwHxvvarRK2V0vaSRi32uYaYZyq6v2
 /me4VjrHluX4897/HCjRELpcbhpPK6INsCvfoG2mABW2+2uFACy0yIUFM0Dh4H2/lrXhu9IESpf
 nMPYU6IHGbvX1Na/DuUB5zgKljhZ+b79smW5nyjKtJE8nBaxGWz680J4Z25uG7Q==
X-Gm-Gg: ASbGncuBuq+8boOkjOu8jJhsG8fiuj0RjShgQpE5jBN86d2lem5e+8Gy+pNZAaflCqb
 CcedP1nFaAc3xICIoBgohyz/2Ie9FajEMGEmIeAjEby4wLuRR1flQjoVRzS1Qq6jmErLQMrcmXZ
 Hwd8/S+ZpO3zTuVWQTZbwBeYpxoNiUXKIlXJdMzGwZ21KUH9MK9vzaMwCjmOt7UOsXV5kuAeNqU
 2xpoO5/mZYKctIy/4hBOvVGUiK5H+Isn9L9KLdmVloLfH4ouxTfBrmAUGOJ/g==
X-Received: by 2002:a17:907:3f11:b0:ab2:aea7:510f with SMTP id
 a640c23a62f3a-ab38b320310mr425608166b.30.1737142817058; 
 Fri, 17 Jan 2025 11:40:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6byZGf3zER2luuH6R2ebrcD5twTbc6HkYOOuFRATHSL5vwYA0+GcMdkji3gsjKP+xQTIxRg==
X-Received: by 2002:a17:907:3f11:b0:ab2:aea7:510f with SMTP id
 a640c23a62f3a-ab38b320310mr425602266b.30.1737142815320; 
 Fri, 17 Jan 2025 11:40:15 -0800 (PST)
Received: from [192.168.10.47] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384fce6ddsm216656066b.180.2025.01.17.11.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 11:40:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 04/10] rust: callbacks: allow passing optional callbacks as ()
Date: Fri, 17 Jan 2025 20:39:57 +0100
Message-ID: <20250117194003.1173231-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117194003.1173231-1-pbonzini@redhat.com>
References: <20250117194003.1173231-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: el2y5yYiEdz1dTU0Hk6ctq8GZ102YUgmXjPowFeGddI_1737142818
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
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
X-List-Received-Date: Fri, 17 Jan 2025 19:40:27 -0000

In some cases, callbacks are optional.  Using "Some(function)" and "None"
does not work well, because when someone writes "None" the compiler does
not know what to use for "F" in "Option<F>".

Therefore, adopt () to mean a "null" callback.  It is possible to enforce
that a callback is valid by adding a "let _: () = F::ASSERT_IS_SOME" before
the invocation of F::call.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/callbacks.rs | 97 ++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/rust/qemu-api/src/callbacks.rs b/rust/qemu-api/src/callbacks.rs
index 314f9dce962..a59878bfb74 100644
--- a/rust/qemu-api/src/callbacks.rs
+++ b/rust/qemu-api/src/callbacks.rs
@@ -79,6 +79,31 @@
 /// call_it(&move |_| String::from(x), "hello workd");
 /// ```
 ///
+/// `()` can be used to indicate "no function":
+///
+/// ```
+/// # use qemu_api::callbacks::FnCall;
+/// fn optional<F: for<'a> FnCall<(&'a str,), String>>(_f: &F, s: &str) -> Option<String> {
+///     if F::IS_SOME {
+///         Some(F::call((s,)))
+///     } else {
+///         None
+///     }
+/// }
+///
+/// assert!(optional(&(), "hello world").is_none());
+/// ```
+///
+/// Invoking `F::call` will then be a run-time error.
+///
+/// ```should_panic
+/// # use qemu_api::callbacks::FnCall;
+/// # fn call_it<F: for<'a> FnCall<(&'a str,), String>>(_f: &F, s: &str) -> String {
+/// #     F::call((s,))
+/// # }
+/// let s: String = call_it(&(), "hello world"); // panics
+/// ```
+///
 /// # Safety
 ///
 /// Because `Self` is a zero-sized type, all instances of the type are
@@ -93,10 +118,70 @@ pub unsafe trait FnCall<Args, R = ()>: 'static + Sync + Sized {
     /// Rust 1.79.0+.
     const ASSERT_ZERO_SIZED: () = { assert!(mem::size_of::<Self>() == 0) };
 
+    /// Referring to this constant asserts that the `Self` type is an actual
+    /// function type, which can be used to catch incorrect use of `()`
+    /// at  compile time.
+    ///
+    /// # Examples
+    ///
+    /// ```compile_fail
+    /// # use qemu_api::callbacks::FnCall;
+    /// fn call_it<F: for<'a> FnCall<(&'a str,), String>>(_f: &F, s: &str) -> String {
+    ///     let _: () = F::ASSERT_IS_SOME;
+    ///     F::call((s,))
+    /// }
+    ///
+    /// let s: String = call_it((), "hello world"); // does not compile
+    /// ```
+    ///
+    /// Note that this use more simply `const { assert!(F::IS_SOME) }` in
+    /// Rust 1.79.0 or newer.
+    const ASSERT_IS_SOME: () = { assert!(Self::IS_SOME) };
+
+    /// `true` if `Self` is an actual function type and not `()`.
+    ///
+    /// # Examples
+    ///
+    /// You can use `IS_SOME` to catch this at compile time:
+    ///
+    /// ```compile_fail
+    /// # use qemu_api::callbacks::FnCall;
+    /// fn call_it<F: for<'a> FnCall<(&'a str,), String>>(_f: &F, s: &str) -> String {
+    ///     const { assert!(F::IS_SOME) }
+    ///     F::call((s,))
+    /// }
+    ///
+    /// let s: String = call_it((), "hello world"); // does not compile
+    /// ```
+    const IS_SOME: bool;
+
+    /// `false` if `Self` is an actual function type, `true` if it is `()`.
+    fn is_none() -> bool {
+        !Self::IS_SOME
+    }
+
+    /// `true` if `Self` is an actual function type, `false` if it is `()`.
+    fn is_some() -> bool {
+        Self::IS_SOME
+    }
+
     /// Call the function with the arguments in args.
     fn call(a: Args) -> R;
 }
 
+/// `()` acts as a "null" callback.  Using `()` and `function` is nicer
+/// than `None` and `Some(function)`, because the compiler is unable to
+/// infer the type of just `None`.  Therefore, the trait itself acts as the
+/// option type, with functions [`FnCall::is_some`] and [`FnCall::is_none`].
+unsafe impl<Args, R> FnCall<Args, R> for () {
+    const IS_SOME: bool = false;
+
+    /// Call the function with the arguments in args.
+    fn call(_a: Args) -> R {
+        panic!("callback not specified")
+    }
+}
+
 macro_rules! impl_call {
     ($($args:ident,)* ) => (
         // SAFETY: because each function is treated as a separate type,
@@ -106,6 +191,8 @@ unsafe impl<F, $($args,)* R> FnCall<($($args,)*), R> for F
         where
             F: 'static + Sync + Sized + Fn($($args, )*) -> R,
         {
+            const IS_SOME: bool = true;
+
             #[inline(always)]
             fn call(a: ($($args,)*)) -> R {
                 let _: () = Self::ASSERT_ZERO_SIZED;
@@ -141,4 +228,14 @@ fn do_test_call<'a, F: FnCall<(&'a str,), String>>(_f: &F) -> String {
     fn test_call() {
         assert_eq!(do_test_call(&str::to_owned), "hello world")
     }
+
+    // The `_f` parameter is unused but it helps the compiler infer `F`.
+    fn do_test_is_some<'a, F: FnCall<(&'a str,), String>>(_f: &F) {
+        assert!(F::is_some());
+    }
+
+    #[test]
+    fn test_is_some() {
+        do_test_is_some(&str::to_owned);
+    }
 }
-- 
2.47.1


