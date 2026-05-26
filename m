Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDA8CD5BB1
	for <qemu-rust@archiver.kernel.org>; Tue, 26 May 2026 17:56:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wRw1B-0001yp-6a; Tue, 26 May 2026 13:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw1A-0001yR-5F
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw18-0007vt-CX
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779818197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NhpMW+defQp1Zy/D4N51kFlexsTA9gX8PHAGBhgbGMA=;
 b=hknwhCaJRcwChDcC6R9wBnGttl4VzHlWdandgTMX43T01CH9X2yDs6ovjWUB3Q0OFQp6mW
 mQeO/c7BpyEzMYsrZhVXL/AW3ins/InRceylbK8oAy5VbQDl3Wj51JZxz/hFSH47AtIYOk
 HsW8AEpOjtOdPn//Wof+afCZ5i3MNX4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-MPAZK31kMe2hysB6QM064Q-1; Tue, 26 May 2026 13:56:36 -0400
X-MC-Unique: MPAZK31kMe2hysB6QM064Q-1
X-Mimecast-MFC-AGG-ID: MPAZK31kMe2hysB6QM064Q_1779818195
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-48fe6894f3fso63682665e9.2
 for <qemu-rust@nongnu.org>; Tue, 26 May 2026 10:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779818195; x=1780422995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NhpMW+defQp1Zy/D4N51kFlexsTA9gX8PHAGBhgbGMA=;
 b=BWtoOahrAiwYR7BYq/p4qC6LkYPkqFtqrZ4w5UbGkZsbAXS3OA+VPvqyz/5vyFh7R1
 7AOYXexV0tu8cX4gJvUV/kdmGlwxcHn6BlXRRo8km+kRq5sD2LWc+x3gHWD2bjEJajkM
 lQlNcc51+DcnyZHv/VVTNJRLgXiwSUyfJARcSqosCqmnpqMMBXHStN1oUuqE4RvnU8+X
 rZNRvo0Y7LjESU4YeERQbjmfDKhEMWkWDOTo967c9T2IFz+YLWoFTNvgUYPR56Q0J4yI
 tX38W05D06ksJ7YvUuBE4P9srKlEtSYapegkOD1+PP/UgExjKeAds85xXECT6rcu7e9q
 Bt2g==
X-Gm-Message-State: AOJu0YzgIEx3m9/bLHJLejjJ47QA95vGKpuQVuwdSeIz9Y5uuh7i3ks4
 B2TRumVHLbpHVFSSuLU7/X2Yzs6U2y8/0BpOq3hSTnzFy9fpY3XF7pS0UWmgIpNOrkmuEuzHwQh
 k9NAvRFmVM6CzEg6WE9uoRPwPwtFF+Rmfjl8ZJoddy2B+D++NrdF+Zn4=
X-Gm-Gg: Acq92OH8Qi7rbN2wSTn6jnf2ZmNQ2f3HjHunh54U3dRFP/+h1/xcKveb+wQO9A0QVWI
 1kBrxIoEj7/P1Ajdc2LeHS+WezZXvIOHr+X8pHvEdRdlMXj9MUCB6g7XdSwEojHXQW6EgnNhLos
 wMapryGzuXN06ZxrIdn/kgjBSt88Q/eeVb+nYWycl36aeizfNXVyM5F1trkOTFwT6ezZcKJJa7E
 1HMLuss/l83Rgyu3a2MhyWMS/UJphKAs1DqmYcpT672tgdK8l9YYT9uyODHgFcB/WOX0k0eFbS7
 0vMrL+zloGgjfM7Aq994PJwnrvXKRAaOEQYNBvvXUo1XSzL4L/WyLYxi2iP8FJSJt6eR8MgrEui
 4LbKQJ4Z1WQZA7jmH1E245cRKRIFtGdvrgCnMU8qqabo9XtA9qZk+39/QeTWXNj9m0M28W5Yl1Y
 6g0R6yDfmWrMtx93/H7PNLMI02XcFl5Ibw62zRPA==
X-Received: by 2002:a05:600c:45c9:b0:490:5cb3:e94a with SMTP id
 5b1f17b1804b1-4905cb3eb81mr192571745e9.2.1779818195079; 
 Tue, 26 May 2026 10:56:35 -0700 (PDT)
X-Received: by 2002:a05:600c:45c9:b0:490:5cb3:e94a with SMTP id
 5b1f17b1804b1-4905cb3eb81mr192571345e9.2.1779818194564; 
 Tue, 26 May 2026 10:56:34 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.251.208])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454ac676sm373142235e9.13.2026.05.26.10.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 10:56:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, armbru@redhat.com, marcandre.lureau@redhat.com,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 05/19] rust/qobject: add Deserialize implementation
Date: Tue, 26 May 2026 19:56:04 +0200
Message-ID: <20260526175618.227743-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526175618.227743-1-pbonzini@redhat.com>
References: <20260526175618.227743-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 96nK5SdDr5EzE4clvPp0DqZAq-Gb9gYujH7VQXCmb6Y_1779818195
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This allows QObject to be created from any serializable format, for
example JSON via serde_json.

This is not too useful, since QObjects are produced by
C code or by serializing structs, but it can be used for testing
and it is part of the full implementation of a serde format.

It is relatively simple and similar to the Serializer, just with
the extra indirection of a Visitor.

Co-authored-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/util/src/qobject/deserialize.rs | 134 +++++++++++++++++++++++++++
 rust/util/src/qobject/mod.rs         |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 rust/util/src/qobject/deserialize.rs

diff --git a/rust/util/src/qobject/deserialize.rs b/rust/util/src/qobject/deserialize.rs
new file mode 100644
index 00000000000..3ac1cabbae6
--- /dev/null
+++ b/rust/util/src/qobject/deserialize.rs
@@ -0,0 +1,134 @@
+//! `QObject` deserialization
+//!
+//! This module implements the [`Deserialize`] trait for `QObject`,
+//! allowing it to be created from any serializable format, for
+//! example JSON.
+
+use core::fmt;
+use std::ffi::CString;
+
+use serde::de::{self, Deserialize, MapAccess, SeqAccess, Visitor};
+
+use super::{to_qobject, QObject};
+
+impl<'de> Deserialize<'de> for QObject {
+    #[inline]
+    fn deserialize<D>(deserializer: D) -> Result<QObject, D::Error>
+    where
+        D: serde::Deserializer<'de>,
+    {
+        struct ValueVisitor;
+
+        impl<'de> Visitor<'de> for ValueVisitor {
+            type Value = QObject;
+
+            fn expecting(&self, formatter: &mut fmt::Formatter) -> fmt::Result {
+                formatter.write_str("any valid JSON value")
+            }
+
+            #[inline]
+            fn visit_bool<E>(self, value: bool) -> Result<QObject, E> {
+                Ok(value.into())
+            }
+
+            #[inline]
+            fn visit_i64<E>(self, value: i64) -> Result<QObject, E> {
+                Ok(value.into())
+            }
+
+            fn visit_i128<E>(self, value: i128) -> Result<QObject, E>
+            where
+                E: serde::de::Error,
+            {
+                to_qobject(value).map_err(|_| de::Error::custom("number out of range"))
+            }
+
+            #[inline]
+            fn visit_u64<E>(self, value: u64) -> Result<QObject, E> {
+                Ok(value.into())
+            }
+
+            fn visit_u128<E>(self, value: u128) -> Result<QObject, E>
+            where
+                E: serde::de::Error,
+            {
+                to_qobject(value).map_err(|_| de::Error::custom("number out of range"))
+            }
+
+            #[inline]
+            fn visit_f64<E>(self, value: f64) -> Result<QObject, E> {
+                Ok(value.into())
+            }
+
+            #[inline]
+            fn visit_str<E>(self, value: &str) -> Result<QObject, E>
+            where
+                E: serde::de::Error,
+            {
+                CString::new(value)
+                    .map_err(de::Error::custom)
+                    .map(QObject::from)
+            }
+
+            #[inline]
+            fn visit_string<E>(self, value: String) -> Result<QObject, E>
+            where
+                E: serde::de::Error,
+            {
+                CString::new(value)
+                    .map_err(de::Error::custom)
+                    .map(QObject::from)
+            }
+
+            #[inline]
+            fn visit_none<E>(self) -> Result<QObject, E> {
+                Ok(().into())
+            }
+
+            #[inline]
+            fn visit_some<D>(self, deserializer: D) -> Result<QObject, D::Error>
+            where
+                D: serde::Deserializer<'de>,
+            {
+                Deserialize::deserialize(deserializer)
+            }
+
+            #[inline]
+            fn visit_unit<E>(self) -> Result<QObject, E> {
+                Ok(().into())
+            }
+
+            #[inline]
+            fn visit_seq<V>(self, mut visitor: V) -> Result<QObject, V::Error>
+            where
+                V: SeqAccess<'de>,
+            {
+                // TODO: insert elements one at a time
+                let mut vec = Vec::<QObject>::new();
+
+                while let Some(elem) = visitor.next_element()? {
+                    vec.push(elem);
+                }
+                Ok(QObject::from_iter(vec))
+            }
+
+            fn visit_map<V>(self, mut visitor: V) -> Result<QObject, V::Error>
+            where
+                V: MapAccess<'de>,
+            {
+                // TODO: insert elements one at a time
+                let mut vec = Vec::<(CString, QObject)>::new();
+
+                if let Some(first_key) = visitor.next_key()? {
+                    vec.push((first_key, visitor.next_value()?));
+                    while let Some((key, value)) = visitor.next_entry()? {
+                        vec.push((key, value));
+                    }
+                }
+                Ok(QObject::from_iter(vec))
+            }
+        }
+
+        deserializer.deserialize_any(ValueVisitor)
+    }
+}
diff --git a/rust/util/src/qobject/mod.rs b/rust/util/src/qobject/mod.rs
index c94b2028c1d..6920b9d2777 100644
--- a/rust/util/src/qobject/mod.rs
+++ b/rust/util/src/qobject/mod.rs
@@ -6,6 +6,7 @@
 
 #![deny(clippy::unwrap_used)]
 
+mod deserialize;
 mod error;
 mod serialize;
 mod serializer;
-- 
2.54.0


