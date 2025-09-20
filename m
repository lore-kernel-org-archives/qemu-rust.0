Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B46CAC5A7
	for <qemu-rust@archiver.kernel.org>; Sat, 20 Sep 2025 14:31:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uzybO-0007Gz-8c; Sat, 20 Sep 2025 10:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uzybN-0007Gb-6C
 for qemu-rust@nongnu.org; Sat, 20 Sep 2025 10:30:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uzybL-0005Rv-D3
 for qemu-rust@nongnu.org; Sat, 20 Sep 2025 10:30:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758378610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y0J9X0otTLwkzasLt1UDH9KlN9sxJ9cBWuhH6pKrvTE=;
 b=J+kHyGJtdGn8krofo8fau9gn2pM+BQ385KW13agxI0ZKTdlhHMCfuo0+WMsQnH9Q0XnC7r
 ILIadieSduQWYo7jCTICjl+a6SFdrZWxw+vJgFlWDkngxdiT+avE0g+YiXiLu3pDtrpqx1
 WfO9ohpWX4BdHtiEDp7HjG8P+1p2mbQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-ttxAA3XHMpm0sg3h-5c5nQ-1; Sat, 20 Sep 2025 10:30:09 -0400
X-MC-Unique: ttxAA3XHMpm0sg3h-5c5nQ-1
X-Mimecast-MFC-AGG-ID: ttxAA3XHMpm0sg3h-5c5nQ_1758378608
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45f2b9b99f0so931775e9.1
 for <qemu-rust@nongnu.org>; Sat, 20 Sep 2025 07:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758378608; x=1758983408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y0J9X0otTLwkzasLt1UDH9KlN9sxJ9cBWuhH6pKrvTE=;
 b=hazrhLciYfC7VBNNC5MCC66+MEF4Gc/jpD+mVqpdw0sP4AamfoMICn+kMAwROS7AtT
 j8ucId9eEKdCg35hlFLWX84KCkWIbfFmi+bdiwOgoqSfjNQcfwOCvgNnDpV6LxGWB2Or
 Bce0QRo4Dj3F8zi4KIwrKXUYDE0+DZw5dG4o7D+y23xuxXa6nY3uYVcMUIsEpT69MhIQ
 /wFTYlw0jlDXJK/g0SBKHtjMrmAsoNzBDzQ1o/Yun8u2ec7IsPoZjrvr+6OzaZqUKzQw
 OKVWCt+XMQjBrAtcLvwz0hNj6QSVQNddsbBUg4ImzMyOql40EnR2x4iLZ7bLTcACjg4p
 Z+2g==
X-Gm-Message-State: AOJu0YxDZNSU7ZX6bW3MRBoqyqMT8RQCxuyX1KE7QJUw8PcuCD0LrUMO
 3GXb6RUojPwGx8tNAT3Qs8xd6IpYSsmfZRmRWsGk7yYOrlVxGouJG2Rbsmtv2DRj1cGiw34Y757
 YQG5LA9rfN6VtW3emq2UD4HYrxgComqBp/yjpYDw2Ykk5WEQCodBDHnE=
X-Gm-Gg: ASbGncs7rlkrQe/NUxwRxHvs4rM0FeuEhKA2T7WUAGPtp52pakTuYlzHGXdNTHhQSbv
 9zrIk0RR0yOA6bX2K+QflTwWBGXI/nWSxmjcJNiIo+49UueCoKcx9GIQfV24L7xshMGJMtAJ4Ti
 rgwowIYr0DzeRR42xQS7RcXlYmOEwNFHywPIbvFlx1Doi+9b9Uo2mH0TGx/74kW5Nkc3Dw+J8WR
 zkHmwId9KI61NCRIz2fOkqVByQtO9CJ9iFGXdbkfXuntquz5VRKRDrSc8B5xhk9ZjuDI1QPJYny
 yN5ygTtqayhVeQiCCQDChzSXLpLP6hJSL1wOKplSz5Tk7X+nx4+0OWrRM3s/BKhdMVRj27tRxg0
 xp8fZcmKBxTClB07OZdL9VCADf0PLMoV+CJj6bh3ErqQ=
X-Received: by 2002:a05:600c:34c8:b0:45b:8b95:7119 with SMTP id
 5b1f17b1804b1-464f81642e8mr114252215e9.8.1758378607936; 
 Sat, 20 Sep 2025 07:30:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfhatReDU9ArBw+DDqbbFgu0vDxDVZRAp48hqeXuZBgwvm6fdJ6o4wpAJAY0O0Bz46Q6z3mQ==
X-Received: by 2002:a05:600c:34c8:b0:45b:8b95:7119 with SMTP id
 5b1f17b1804b1-464f81642e8mr114252005e9.8.1758378607504; 
 Sat, 20 Sep 2025 07:30:07 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.47.123])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613e09f879sm166476175e9.19.2025.09.20.07.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 07:30:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, zhao1.liu@intel.com, manos.pitsidianakis@linaro.org
Subject: [PATCH 3/7] rust: migration: extract vmstate_fields_ref
Date: Sat, 20 Sep 2025 16:29:54 +0200
Message-ID: <20250920142958.181910-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920142958.181910-1-pbonzini@redhat.com>
References: <20250920142958.181910-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5TynoPdIz3lk-WF46wmcPi4ULXUJwAlB1Zdmm0GGM6w_1758378608
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.045,
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

This is useful when building a VMState for generic structs, because you have
to avoid nested statics.  Using vmstate_fields! will fail in the likely case
where the _FIELDS static uses Self from an outer item, because that is
forbidden.

I also looked into returning a &'static [VMStateField] from vmstate_fields!,
but that also fails; the fields are not promoted to static, which is
unfortunate but intentional (https://github.com/rust-lang/rust/issues/60502):

error[E0716]: temporary value dropped while borrowed
   --> rust/hw/char/pl011/libpl011.rlib.p/structured/device.rs:743:17
    |
738 | /      VMStateDescriptionBuilder::<PL011State>::new()
739 | |          .name(c"pl011/clock")
740 | |          .version_id(1)
741 | |          .minimum_version_id(1)
742 | |          .needed(&PL011State::clock_needed)
743 | |          .fields(vmstate_fields! {
    | | _________________^
744 | ||              vmstate_of!(PL011State, clock),
745 | ||         })
    | ||_________^- argument requires that borrow lasts for `'static`
    |  |_________|
    |            creates a temporary value which is freed while still in use
746 |            .build();
    |                   - temporary value is freed at the end of this statement

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/migration/src/vmstate.rs | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/rust/migration/src/vmstate.rs b/rust/migration/src/vmstate.rs
index 05a833a8b7d..421a236194d 100644
--- a/rust/migration/src/vmstate.rs
+++ b/rust/migration/src/vmstate.rs
@@ -413,19 +413,30 @@ const fn phantom__<T>(_: &T) -> ::core::marker::PhantomData<T> {
     }};
 }
 
+/// Add a terminator to the fields in the arguments, and return
+/// a reference to the resulting array of values.
+#[macro_export]
+macro_rules! vmstate_fields_ref {
+    ($($field:expr),*$(,)*) => {
+        &[
+            $($field),*,
+            $crate::bindings::VMStateField {
+                flags: $crate::bindings::VMStateFlags::VMS_END,
+                ..::common::zeroable::Zeroable::ZERO
+            }
+        ]
+    }
+}
+
 /// Helper macro to declare a list of
 /// ([`VMStateField`](`crate::bindings::VMStateField`)) into a static and return
 /// a pointer to the array of values it created.
 #[macro_export]
 macro_rules! vmstate_fields {
     ($($field:expr),*$(,)*) => {{
-        static _FIELDS: &[$crate::bindings::VMStateField] = &[
+        static _FIELDS: &[$crate::bindings::VMStateField] = $crate::vmstate_fields_ref!(
             $($field),*,
-            $crate::bindings::VMStateField {
-                flags: $crate::bindings::VMStateFlags::VMS_END,
-                ..::common::zeroable::Zeroable::ZERO
-            }
-        ];
+        );
         _FIELDS.as_ptr()
     }}
 }
-- 
2.51.0


