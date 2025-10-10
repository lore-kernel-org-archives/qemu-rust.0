Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9F7CCD185
	for <qemu-rust@archiver.kernel.org>; Fri, 10 Oct 2025 15:11:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v7Elv-0000H9-8O; Fri, 10 Oct 2025 11:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7Elu-0000FZ-4B
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:11:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v7ElT-00048l-6u
 for qemu-rust@nongnu.org; Fri, 10 Oct 2025 11:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760109037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EPkG2xx4KAvF4Noc00ffAe3GOSuomsju0SDpOtx5xNM=;
 b=SreXylrwmi0w3YXvtaRZr3CgMSoB4TaMiLb3fOiXh0PbykFSyv30BFCIqVEqjXoySq6Gp5
 kTBZcUc+LcaQOwNey0BPNPS2sAVr+RY1bbIobEkVTtV5YvY0fPiXge3p9herIW1NrIU9zr
 JdwlYMZTCBMk6f+oSxbXLlrv/yrSHp8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-HtIh5nYYMWePSSh0znJjMw-1; Fri, 10 Oct 2025 11:10:34 -0400
X-MC-Unique: HtIh5nYYMWePSSh0znJjMw-1
X-Mimecast-MFC-AGG-ID: HtIh5nYYMWePSSh0znJjMw_1760109033
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b4626b2d07bso269955266b.1
 for <qemu-rust@nongnu.org>; Fri, 10 Oct 2025 08:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760109033; x=1760713833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EPkG2xx4KAvF4Noc00ffAe3GOSuomsju0SDpOtx5xNM=;
 b=KokskJ9WkxSA1ReuZsMQNry9KseNS6sFJYckfVtc2g5osKduFwEhlRmsUzYrpn+yGb
 8/9mZKLbuwIGJIlz7oJ3AKX11i5lbYwzjkOdMy/77OauF7cBYzE1oE0H18uafXGuFftm
 0X04knrxhEHjWYgXeFDhrPRPHd1zGhjzdz2nhOXxvsKuJZ/ER9CZm+frZTPi+5InHMnY
 Oav9igjndCW4mC2VmmwMooHo9pZ3xpbyBv0P/gn45KpU/jP2+8flZOo5nyvzPd0MZwxx
 AZRk66rV+45yrYytHSH9peW1XAQ7V3Z8krFXzbAI4ck1MkRjDD1iTNZGB7gF023F3Zfy
 MsHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV91nXt5EZBc9US5w3TFZe7rC9Ai9UHwMJD9lUuuDzF8WQ6R3KkphqjGhIk2qE4qfaSde7GFE4wvO4=@nongnu.org
X-Gm-Message-State: AOJu0Yyol3iQ8ABG4LCrhav1hLG6NCMRGjpmoR0AuR8MlTdU2Ti/TsUR
 zriGQWV9FrjPD/Iisb2wUARkOwYa+GK57hxokbMgrIaIWAxgb7Fo7dy69KMcCb6Thuobtx3UvXx
 zjogDEUmnsZxEpu+JXLft+JdPn9eoVyLBQz6OvoKd+9XugWRE2Tx4Xq4=
X-Gm-Gg: ASbGncsAoHj5g6nGuwVtsYT2Xy5i+02UkT4FA9VzwhAJvTZ/iffKSwrsjIhy6TpITlm
 Fq7p1vw2SPprj11JjIqTsRACOJJq6s4qeWUpCRQGbTHAXuu5F5nwLysTZ6YFUAw09u26T47m6zG
 T+XKlAV8qkEAZ+WrCTGQV6Eq4YbEQe6pxeBKQmOyBeZ5uit1aprZMT77UC4HgYwt2WxcI0p7yUU
 etXZ9Acmsc6IkznWZ1ofxoy2YGN0m/ZtXB2cFwT/cqLTxCJmWHsnJGnU7XvAzhjm5gZzDHPcH9p
 Vopqek/cT8Fy0DME7iOOEd2YJPT7gsBvYkujyyCb5JB2ZKl7+WA0SVdl5pbMwIKpkI36kMFJJyY
 /P6Fg8YP7qU7hiOegatTMEmii7tbIX7MUYWpWWDVV4FY1
X-Received: by 2002:a17:906:4fcd:b0:b50:697e:ba3 with SMTP id
 a640c23a62f3a-b50acc1a958mr1310613866b.63.1760109033010; 
 Fri, 10 Oct 2025 08:10:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDAAstEQn10E5MsdgMsXmttGl8Yg1vLsUH+5bnWAxRACDNkifI2nueZYHnrwsMjlGLgzC8Kw==
X-Received: by 2002:a17:906:4fcd:b0:b50:697e:ba3 with SMTP id
 a640c23a62f3a-b50acc1a958mr1310611066b.63.1760109032539; 
 Fri, 10 Oct 2025 08:10:32 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.231.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d9526885sm253031366b.84.2025.10.10.08.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 08:10:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	marcandre.lureau@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 10/19] rust/util: replace Error::err_or_unit/err_or_else with
 Error::with_errp
Date: Fri, 10 Oct 2025 17:09:55 +0200
Message-ID: <20251010151006.791038-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010151006.791038-1-pbonzini@redhat.com>
References: <20251010151006.791038-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LEa-idnftAnM5OBwUM0XNzAgbo4TBVSccCuiTPCzM38_1760109033
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Introduce a simpler function that hides the creation of the Error**.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/util/src/error.rs | 52 ++++++++++++++++--------------------------
 1 file changed, 20 insertions(+), 32 deletions(-)

diff --git a/rust/util/src/error.rs b/rust/util/src/error.rs
index bdbf2634170..5a0dd7786b5 100644
--- a/rust/util/src/error.rs
+++ b/rust/util/src/error.rs
@@ -14,8 +14,7 @@
 //!   [`ptr_or_propagate`](crate::Error::ptr_or_propagate) can be used to build
 //!   a C return value while also propagating an error condition
 //!
-//! * [`err_or_else`](crate::Error::err_or_else) and
-//!   [`err_or_unit`](crate::Error::err_or_unit) can be used to build a `Result`
+//! * [`with_errp`](crate::Error::with_errp) can be used to build a `Result`
 //!
 //! This module is most commonly used at the boundary between C and Rust code;
 //! other code will usually access it through the
@@ -208,35 +207,21 @@ pub unsafe fn propagate(self, errp: *mut *mut bindings::Error) {
         }
     }
 
-    /// Convert a C `Error*` into a Rust `Result`, using
-    /// `Ok(())` if `c_error` is NULL.  Free the `Error*`.
+    /// Pass a C `Error*` to the closure, and convert the result
+    /// (either the return value of the closure, or the error)
+    /// into a Rust `Result`.
     ///
     /// # Safety
     ///
-    /// `c_error` must be `NULL` or valid; typically it was initialized
-    /// with `ptr::null_mut()` and passed by reference to a C function.
-    pub unsafe fn err_or_unit(c_error: *mut bindings::Error) -> Result<()> {
-        // SAFETY: caller guarantees c_error is valid
-        unsafe { Self::err_or_else(c_error, || ()) }
-    }
+    /// One exit from `f`, `c_error` must be unchanged or point to a
+    /// valid C [`struct Error`](bindings::Error).
+    pub unsafe fn with_errp<T, F: FnOnce(&mut *mut bindings::Error) -> T>(f: F) -> Result<T> {
+        let mut c_error: *mut bindings::Error = ptr::null_mut();
 
-    /// Convert a C `Error*` into a Rust `Result`, calling `f()` to
-    /// obtain an `Ok` value if `c_error` is NULL.  Free the `Error*`.
-    ///
-    /// # Safety
-    ///
-    /// `c_error` must be `NULL` or point to a valid C [`struct
-    /// Error`](bindings::Error); typically it was initialized with
-    /// `ptr::null_mut()` and passed by reference to a C function.
-    pub unsafe fn err_or_else<T, F: FnOnce() -> T>(
-        c_error: *mut bindings::Error,
-        f: F,
-    ) -> Result<T> {
-        // SAFETY: caller guarantees c_error is valid
-        let err = unsafe { Option::<Self>::from_foreign(c_error) };
-        match err {
-            None => Ok(f()),
-            Some(err) => Err(err),
+        // SAFETY: guaranteed by the postcondition of `f`
+        match (f(&mut c_error), unsafe { c_error.into_native() }) {
+            (result, None) => Ok(result),
+            (_, Some(err)) => Err(err),
         }
     }
 }
@@ -421,13 +406,16 @@ fn test_ptr_or_propagate() {
     }
 
     #[test]
-    fn test_err_or_unit() {
+    fn test_with_errp() {
         unsafe {
-            let result = Error::err_or_unit(ptr::null_mut());
-            assert_match!(result, Ok(()));
+            let result = Error::with_errp(|_errp| true);
+            assert_match!(result, Ok(true));
 
-            let err = error_for_test(c"msg");
-            let err = Error::err_or_unit(err.into_inner()).unwrap_err();
+            let err = Error::with_errp(|errp| {
+                *errp = error_for_test(c"msg").into_inner();
+                false
+            })
+            .unwrap_err();
             assert_eq!(&*format!("{err}"), "msg");
         }
     }
-- 
2.51.0


