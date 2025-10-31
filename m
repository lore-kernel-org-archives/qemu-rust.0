Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5292CCF9F8
	for <qemu-rust@archiver.kernel.org>; Fri, 31 Oct 2025 15:26:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vEr0u-000162-Es; Fri, 31 Oct 2025 11:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vEr0t-00015V-2V
 for qemu-rust@nongnu.org; Fri, 31 Oct 2025 11:26:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vEr0p-0000op-7D
 for qemu-rust@nongnu.org; Fri, 31 Oct 2025 11:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761924354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rhztnyZ1fNBhV8SQSbp7sZrMppapud0hpLsKWcngaNE=;
 b=hPqS6KXcNCo3clvE65zPkkkFzYRtnW9uSR0PGgxmpQZFonAzm1uxTjP2ewDac0Y6dbjuYi
 +XU4e03+VyaVHGQ3elbS+QfA9t/DbUOx2W/g0U+dYN6gO8LgAQnOoU49Ii46ufVTMSmx4H
 VXTDvyLuw0P6o6nfy3Ab7sclE8MlL5Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-82gY9DCEPWKzqvI95Zu0BA-1; Fri, 31 Oct 2025 11:25:53 -0400
X-MC-Unique: 82gY9DCEPWKzqvI95Zu0BA-1
X-Mimecast-MFC-AGG-ID: 82gY9DCEPWKzqvI95Zu0BA_1761924352
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-42705afbf19so1391228f8f.1
 for <qemu-rust@nongnu.org>; Fri, 31 Oct 2025 08:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761924352; x=1762529152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rhztnyZ1fNBhV8SQSbp7sZrMppapud0hpLsKWcngaNE=;
 b=d8PI0VmRfaZI5uqKDouXzaQjXz1alpRZOevoFL7GL3HvzzZHZtW+YvIhNiKJh59E+X
 m+xY2fY7i8qzTHWVPZhQWqGOsPuCoMeRn7qMuWOxG7t/zs1efwM9GVKk+PuAYP3wsUjA
 46XOdjS5anICTv+emuj9cvdFuksHm97xONp6By04i81KnvpiOkl7Nk0lDj1ZIfj9JNdH
 WX+tlTpwQ5EWQXkMLqRCr8QzIvbFXC9gRG9HWVMgW4G/RxEohFo6rW2cr/NzgmrKhjRy
 JdZWMD3Hasz3LJJxTwmsu+AYIq1RX7itHZIN521fGiQIFE1e4LGKNB0joZsOWDhctDGB
 HLxA==
X-Gm-Message-State: AOJu0YzOs8pvXAtUZTO07o+/5ITVxcVrG7D7ZP+R1jZipw7rbLNgU9+N
 87JWuxfZHyOy72xCJSxG7rG2zuMgT+5XvnYC9GRfiLOjwiLrVBCwT1edDc5wp3Zk1xhY9Z9XUwz
 UUjYBwQBat7Lw3Yxn4cXEcImIooLUU2TWXC+II25E9gF8I8IHDYRB4eQ=
X-Gm-Gg: ASbGnctS+Ij4+fB2iqdxrLtXF6mev8xd1KO2BdAU+w1gwXUJPq73akTy74dNmB+qG2C
 5Kq1jeBuFaqJFftqt4qCmBxzhuKJolTs3SY7tt5i93PKxYEKf7nEAXVoiYyCZki9UYAd19mNWfU
 Fk3I5f8ti3A5j0KB5LPRXkIzYyqRwED9RyZvDX40tFpSWdgaH9oCEYhaiFw6Z1Y+XUl8GIgJiEG
 Yf3QSwD5BCgKQsJYDKnoqIOtP52IKL8Zp9qDb0L6ivylaL2+SPgpmAq4cAFxBhCGblAGWbxn+cv
 GqBSLpvCjsSG2+To5vSqe/bh1yet1o5THISSPFfwR9HDgD7qqy0+20dnBbc4tYEO2pflxsmT6ND
 Sn6LUGn0OGz3kbEOexFuWZ/T78Tw8+3K97UBJOyBMGl6rJuW6CX2WV5K2Z8IjVodb1vNMrdg4Lu
 49HUEs
X-Received: by 2002:adf:e193:0:b0:425:86da:325f with SMTP id
 ffacd0b85a97d-429bcda2109mr4357386f8f.27.1761924352020; 
 Fri, 31 Oct 2025 08:25:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB0Wh7Dczto4sCtlbVCCZihcE//My0ye+xILxV8m5LMg79nMkdJ71mzBsBCrDYktng7KMZPQ==
X-Received: by 2002:adf:e193:0:b0:425:86da:325f with SMTP id
 ffacd0b85a97d-429bcda2109mr4357357f8f.27.1761924351572; 
 Fri, 31 Oct 2025 08:25:51 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.110.222])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13e16d8sm4205103f8f.31.2025.10.31.08.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 08:25:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 3/4] rust/util: replace Error::err_or_unit/err_or_else with
 Error::with_errp
Date: Fri, 31 Oct 2025 16:25:38 +0100
Message-ID: <20251031152540.293293-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251031152540.293293-1-pbonzini@redhat.com>
References: <20251031152540.293293-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OpoEGniupMBAvLqtMzqEu6MVtbkA7Em--pgYSbSRoa8_1761924352
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

Introduce a simpler function that hides the creation of the Error**.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/util/src/error.rs | 52 ++++++++++++++++--------------------------
 1 file changed, 20 insertions(+), 32 deletions(-)

diff --git a/rust/util/src/error.rs b/rust/util/src/error.rs
index 11b574ca593..346577e2e53 100644
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
@@ -213,35 +212,21 @@ pub unsafe fn propagate(self, errp: *mut *mut bindings::Error) {
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
@@ -432,13 +417,16 @@ fn test_ptr_or_propagate() {
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
2.51.1


