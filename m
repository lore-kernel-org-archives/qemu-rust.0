Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tgLQL-0007fW-PC
	for mharc-qemu-rust@gnu.org; Fri, 07 Feb 2025 05:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgLPk-0007Ll-3C
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 05:16:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tgLPi-00042n-18
 for qemu-rust@nongnu.org; Fri, 07 Feb 2025 05:16:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738923405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejM9LdULLid2GnKlRXBOXJbddnv2FpH9YLwLU6Alx7U=;
 b=g+XPfgnNsm1k1VS4MIaYOypaMy4vLYdQnGcx5SHpU9RezfW7RvAzoXbX/gDJQAJ/TfoJzk
 DExliPcyYErp1QambAVdFKFppnkoy/UfLzWu+4sfXlgVokveD0O3ZbhBmIpl5kC5SL6odo
 H4qivEZ5rFmkZP3YzREFgLK95u41Vsk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-u7_EiaykMU-_n7KUDRQEjQ-1; Fri, 07 Feb 2025 05:16:43 -0500
X-MC-Unique: u7_EiaykMU-_n7KUDRQEjQ-1
X-Mimecast-MFC-AGG-ID: u7_EiaykMU-_n7KUDRQEjQ
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-ab7912ce928so24564966b.0
 for <qemu-rust@nongnu.org>; Fri, 07 Feb 2025 02:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738923401; x=1739528201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ejM9LdULLid2GnKlRXBOXJbddnv2FpH9YLwLU6Alx7U=;
 b=Ecwin8+sHZjBmMGdNhPcnUpdTKna1xaeEZuf5fq3ogm729JTSMId9xRoBh/3n9vriM
 9YFPBJGZzKyuG2bgIdtysNcomECoaRBHEAT+78BuF/JptlAJLdZNetpuAhdokX5KoKlJ
 gFgLAuc2dr1jh2eUufAsS+/5wwxYzK9rzZ50N15mu1MWSwE48eF33VeFUbWE6t9jC/aD
 o1IClsyGyYFHmLbdJ6FjSGVIMk4GJM9+M16NQ2XpSj6F3MWicGqAQIF4d7HihiJZkibx
 JUFNlrGqK92Ku+FnwPitLGJbfmhZsWkJLaaO+6IGffUG5kVukwR3I0iWWdEvSbNmTvyL
 3jkA==
X-Gm-Message-State: AOJu0YyLkNWCQ4TVXWpnI1rbrJnraz8uOz+lOxEtc1z3qEX5tiHJAMum
 f0N4s/dePyu44kmzc4R6LVs+HvVJi7/n+bfJk4B7oxsyT5m+Dd1DPElUf52tVG36A1NYcN4g/gf
 JZgKTL53cmjINwVph1uKUiIIHfu2cF2+zWYjx8hFCYk1Y4csaObLhZoikCdY1mw==
X-Gm-Gg: ASbGncvAFPWrIZ7N+7ppwc9r1OJCl+9LOSSdnpf/DkalRv0gqsGoO10/y9MyxGa5V8d
 o2cM1RX+J7hgymNqdToElo8b2NLRQZDv8Hx2Z8g2hEk9nChDSXaxYNFx1A4cDyVkdhyTrSPUbkU
 tbCZIsd5mem8JEfv9IebOC2F5ll87RUGyXhzQpK37kEMdvN0mTHM2EjniEoPXjtUaXWglHj/Vlj
 Sk4f/T6PQAd2k6pCaM9p5GldRcGnTqPQdJTDbv6KziiIw9vBOB05h+fQ0EXhskwLHHGI95vZmBY
 Qt+zIA==
X-Received: by 2002:a17:907:9484:b0:ab2:f6e5:3f1 with SMTP id
 a640c23a62f3a-ab789ace50cmr220063066b.8.1738923401252; 
 Fri, 07 Feb 2025 02:16:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYFvkx7kxL5wQX/I6eTUg9VtwNiAsz7cQrnkIWtbX2vjwB7yapZwzOC5xnpFw7o24m1v/ngw==
X-Received: by 2002:a17:907:9484:b0:ab2:f6e5:3f1 with SMTP id
 a640c23a62f3a-ab789ace50cmr220060566b.8.1738923400879; 
 Fri, 07 Feb 2025 02:16:40 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f49361sm240505766b.33.2025.02.07.02.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 02:16:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 03/12] rust: callbacks: allow passing optional callbacks as ()
Date: Fri,  7 Feb 2025 11:16:14 +0100
Message-ID: <20250207101623.2443552-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207101623.2443552-1-pbonzini@redhat.com>
References: <20250207101623.2443552-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xO-r2bKvvcRpuCnRQrrdba-NkcMpcATg04Vwa5DaIgU_1738923402
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Fri, 07 Feb 2025 10:16:59 -0000

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
index 314f9dce962..9642a16eb89 100644
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
+    /// at compile time.
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
+    /// Note that this can be more simply `const { assert!(F::IS_SOME) }` in
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
2.48.1


