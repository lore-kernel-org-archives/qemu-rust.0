Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uN7eK-0007wG-4K
	for mharc-qemu-rust@gnu.org; Thu, 05 Jun 2025 06:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7dp-0007Nv-TV
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7dn-0001Hk-TA
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749118566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZQCdWoOTSdYbeAQWQkf295VeDuJikO78V09umKPWQl8=;
 b=XNjr1W+BrxCwTGygAxJHi5FZb54uXFmpQhXHZuNciBkNZIv1gSJzm6G8dUIaiJxijPI8NA
 ViSHKGPg5Wnv2qdUEO6EUs59R3mgYKDTXuJit7shLqo8UJwldewgJa7/GPKxrQBB8Hi7/8
 BuNILdTGzH7O08W+QoXvQtG+ONvGzyQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-XKwcnDKPNAC8QO1-rYw7jQ-1; Thu, 05 Jun 2025 06:16:04 -0400
X-MC-Unique: XKwcnDKPNAC8QO1-rYw7jQ-1
X-Mimecast-MFC-AGG-ID: XKwcnDKPNAC8QO1-rYw7jQ_1749118564
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4f85f31d9so462660f8f.1
 for <qemu-rust@nongnu.org>; Thu, 05 Jun 2025 03:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749118564; x=1749723364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZQCdWoOTSdYbeAQWQkf295VeDuJikO78V09umKPWQl8=;
 b=kqZ+JFcDdceLoQs8yss8IYNrSda9Uu4PYB4AffdDDUmt45rHqYRqQzoi4VTZqoAYNl
 f7qrjGuaYj05ywfcUaFUrw/Gd9B2tNtMhBuJKuVvIk7wB/2+t4dm3/IcP72DAAqKT2QY
 gxgZF+xV0UkFmQoKP/AemzfoATa+q+KCuWMKfM4TyHoi62PxQwQZb6c88mQDwqwY/7mK
 JF+HNK7rLM0RHiFW7tea+crPVJfUxOCjOZOE5rYyh6fsYJAtMnlYwnncuncGKMNHoZnM
 xO0DzL+kliGuVvPnwZ5qyyMTs9yAQhBTwpCVjLxd+tGdfAfbcS/ISB/VccD7SV6fVfc9
 CosA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYwjhmufRrNT6Bc9xwIhVU2pzaR1OHm/bciHgocmxMoCab+OVhmB6VWXr8ue/GyD1ATAHlsT2s9F4=@nongnu.org
X-Gm-Message-State: AOJu0Yzhm+gCPjJDqOJeRxy1KQGbdy8todmDOYO1y0BkKt8RrjRqf+si
 ueDc3K3jPxK4FMYxqM7ehHQPcvdiZ6oZAD4ENf9k7OvgtXQMO/Mqv9Ri6UzSblVeKmy2tLcMdWi
 A4S44Ltm93wtg7/r5dBkOeaUIpPRGtSVxt3fJ5D64eYR37QQMlj/TB7Y=
X-Gm-Gg: ASbGnctAR9ggLwig/vzh6XLk3ZrO6QGt7lq3ENn8OIqsam+1HBrR8j6GBgQWRSGzO9H
 9+ZoxKsJ92Og5GS3XXjdO/zqQsthg8fp2OfQGaLF4wy+cA3vx3FACIp2n3XPcnRsL65AWdjReTu
 GvVhGTe/NacRkSyLkSAWeo4JT1rSDTq38c8X3WERiqOrATZqSnY5NzvSiawCNnrX0kQsdxoCIOh
 THpdfxdOPilanAal4WFcEF5/aApnl9N4Yi2y5rw4/Aqu5aHL1724ibRgC9+ndfj4FPs9BB+CgYg
 XsPHdpOd1EJHSg==
X-Received: by 2002:a05:6000:18ab:b0:3a4:f41d:6973 with SMTP id
 ffacd0b85a97d-3a51d91b9d8mr5302327f8f.13.1749118563684; 
 Thu, 05 Jun 2025 03:16:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYyS7WrHOeCCeB0Qo+ibeY6lTTD3JU6vd6Kvi6h9sha9RCdOGUQEkIMrCdKb9ndf3nH1THzA==
X-Received: by 2002:a05:6000:18ab:b0:3a4:f41d:6973 with SMTP id
 ffacd0b85a97d-3a51d91b9d8mr5302308f8f.13.1749118563292; 
 Thu, 05 Jun 2025 03:16:03 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451f98138c0sm19782395e9.9.2025.06.05.03.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:16:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 07/14] rust: qemu-api: add tests for Error bindings
Date: Thu,  5 Jun 2025 12:15:36 +0200
Message-ID: <20250605101544.368953-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605101544.368953-1-pbonzini@redhat.com>
References: <20250605101544.368953-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4UCgcD5croPz8z1hTwIXG3YAcHHf_5RXVTjIKMO_Gxg_1749118564
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
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
X-List-Received-Date: Thu, 05 Jun 2025 10:16:11 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/error.rs | 104 +++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/rust/qemu-api/src/error.rs b/rust/qemu-api/src/error.rs
index 80157f6ea1b..e114fc4178b 100644
--- a/rust/qemu-api/src/error.rs
+++ b/rust/qemu-api/src/error.rs
@@ -310,3 +310,107 @@ unsafe fn cloned_from_foreign(c_error: *const bindings::Error) -> Self {
         }
     }
 }
+
+#[cfg(test)]
+mod tests {
+    use std::ffi::CStr;
+
+    use anyhow::anyhow;
+    use foreign::OwnedPointer;
+
+    use super::*;
+    use crate::{assert_match, bindings};
+
+    #[track_caller]
+    fn error_for_test(msg: &CStr) -> OwnedPointer<Error> {
+        // SAFETY: all arguments are controlled by this function
+        let location = panic::Location::caller();
+        unsafe {
+            let err: *mut c_void = libc::malloc(std::mem::size_of::<bindings::Error>());
+            let err: &mut bindings::Error = &mut *err.cast();
+            *err = bindings::Error {
+                msg: msg.clone_to_foreign_ptr(),
+                err_class: bindings::ERROR_CLASS_GENERIC_ERROR,
+                src_len: location.file().len() as c_int,
+                src: location.file().as_ptr().cast::<c_char>(),
+                line: location.line() as c_int,
+                func: ptr::null_mut(),
+                hint: ptr::null_mut(),
+            };
+            OwnedPointer::new(err)
+        }
+    }
+
+    unsafe fn error_get_pretty<'a>(local_err: *mut bindings::Error) -> &'a CStr {
+        unsafe { CStr::from_ptr(bindings::error_get_pretty(local_err)) }
+    }
+
+    #[test]
+    #[allow(deprecated)]
+    fn test_description() {
+        use std::error::Error;
+
+        assert_eq!(super::Error::from("msg").description(), "msg");
+        assert_eq!(super::Error::from("msg".to_owned()).description(), "msg");
+    }
+
+    #[test]
+    fn test_display() {
+        assert_eq!(&*format!("{}", Error::from("msg")), "msg");
+        assert_eq!(&*format!("{}", Error::from("msg".to_owned())), "msg");
+        assert_eq!(&*format!("{}", Error::from(anyhow!("msg"))), "msg");
+
+        assert_eq!(
+            &*format!("{}", Error::with_error("msg", anyhow!("cause"))),
+            "msg: cause"
+        );
+    }
+
+    #[test]
+    fn test_bool_or_propagate() {
+        unsafe {
+            let mut local_err: *mut bindings::Error = ptr::null_mut();
+
+            assert!(Error::bool_or_propagate(Ok(()), &mut local_err));
+            assert_eq!(local_err, ptr::null_mut());
+
+            let my_err = Error::from("msg");
+            assert!(!Error::bool_or_propagate(Err(my_err), &mut local_err));
+            assert_ne!(local_err, ptr::null_mut());
+            assert_eq!(error_get_pretty(local_err), c"msg");
+            bindings::error_free(local_err);
+        }
+    }
+
+    #[test]
+    fn test_ptr_or_propagate() {
+        unsafe {
+            let mut local_err: *mut bindings::Error = ptr::null_mut();
+
+            let ret = Error::ptr_or_propagate(Ok("abc".to_owned()), &mut local_err);
+            assert_eq!(String::from_foreign(ret), "abc");
+            assert_eq!(local_err, ptr::null_mut());
+
+            let my_err = Error::from("msg");
+            assert_eq!(
+                Error::ptr_or_propagate(Err::<String, _>(my_err), &mut local_err),
+                ptr::null_mut()
+            );
+            assert_ne!(local_err, ptr::null_mut());
+            assert_eq!(error_get_pretty(local_err), c"msg");
+            bindings::error_free(local_err);
+        }
+    }
+
+    #[test]
+    fn test_err_or_unit() {
+        unsafe {
+            let result = Error::err_or_unit(ptr::null_mut());
+            assert_match!(result, Ok(()));
+
+            let err = error_for_test(c"msg");
+            let err = Error::err_or_unit(err.into_inner()).unwrap_err();
+            assert_eq!(&*format!("{err}"), "msg");
+        }
+    }
+}
-- 
2.49.0


