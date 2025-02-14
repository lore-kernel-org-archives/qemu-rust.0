Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tiwDQ-0005xJ-Ia
	for mharc-qemu-rust@gnu.org; Fri, 14 Feb 2025 08:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiwDB-0005uh-EJ
 for qemu-rust@nongnu.org; Fri, 14 Feb 2025 08:58:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tiwD8-0001dJ-9s
 for qemu-rust@nongnu.org; Fri, 14 Feb 2025 08:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739541508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jtNzr8uYuWTsnD/A8rhDCCpOJ/XgomM+/PA3Y3Q8jKo=;
 b=AVGB2slCYtXYuBPBOA8FaZi3r0pRcJsRvJLFyOh471os/4WF9KT35qaZ/nLrwCNfWLJBgp
 CLT5nCdIdzvELmoSseY43zt6x42c1/KpLNL4ZfG9/26u57ohHqG8o4qjq9VnmGzoy0ownP
 V66cFXhVI2LhHP2tW70ZAyoQnkBNEhw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-K9lbFzaaN6OdOTjYPPvCqg-1; Fri, 14 Feb 2025 08:58:27 -0500
X-MC-Unique: K9lbFzaaN6OdOTjYPPvCqg-1
X-Mimecast-MFC-AGG-ID: K9lbFzaaN6OdOTjYPPvCqg_1739541506
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ab397fff5a3so204849766b.1
 for <qemu-rust@nongnu.org>; Fri, 14 Feb 2025 05:58:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739541505; x=1740146305;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jtNzr8uYuWTsnD/A8rhDCCpOJ/XgomM+/PA3Y3Q8jKo=;
 b=qBDzB69dTb3buNvFm4vi5uyW3n71GPX5e3zx3UOd/qjRyMY2DxKa/j3OcB8ca1bEhg
 Wo/CGu9NeAEEGmO8WpqQwfokFAJ4MJZrUQQhCkw/Qs+hVkyYec0Sz2XoTQmTyg1o3zN2
 sa7YyWvhh63r9+qjLjsGIBw+ZQayl2Dxi/ePxRzY18l7epCcgVhipAXHbsOditRPlCaY
 GLD0XrVWdncvrAXsPdqybhVrcFk8Wf5FpmsDN3fHp6Mm5qtKjpHFK2WuyiCdeoqKshZ0
 qnZF+lifhS9PkC46nmMTxxwNGIJwe90ezYPjwXq5Mo6m4KmBD8cVgVaOpVEJFKWt70Gh
 xMXg==
X-Gm-Message-State: AOJu0YzvFmSj619VbZtiJV76GVP7BE4RdHcI6S4qwGhhHx3bPUWjU0e5
 /jwSeMkanlUTlPIQmqU/hGvbOztAlrssMqV9OTB86DWGaW+T9uucO4ZO9bGTA8OBDEkPlmn11Ti
 6AIyJrHZ5FeYYlmqCcNkUq5k4vH/BK4qdgVgO+jcz/+afuCH2oNRaMu9WgpzxTQ==
X-Gm-Gg: ASbGncth+OVYkR+oj4/oCMufnm06pJj9ri5q2rUOsw3sdrJRvl1F8jj9ip1J3WVv7N+
 Cr2bMJIz4qpw9chE7f3j2kP3dWcwDVFZ15nucvoPxAH2mQsOZd8MQM2qPtNCAhRF7cIQlxkWztZ
 3HQHymxNqHTzkuirPX83rWEIv/XmFUUzzXbGYvQGt6mb9vMX/yaYk7sPGpeA1Od7lXlAzsZ311D
 BGf5ty9MNBO1wVZkaMjA1O1nDFrex8lDs9F2vHKYS5Bx8V2l7qIjD5GApe9xN7nNCxOssESGC/P
 yVPhia7PZYhF
X-Received: by 2002:a17:906:7151:b0:abb:5b02:9e7 with SMTP id
 a640c23a62f3a-abb5b020aa8mr2969566b.12.1739541504867; 
 Fri, 14 Feb 2025 05:58:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnd4L+j5QGaGaudDq+u5OiHlAq07wQAxYnMKf3Q+05rOF+4KgPrZDiR0QtGxX9p2WukgnYuQ==
X-Received: by 2002:a17:906:7151:b0:abb:5b02:9e7 with SMTP id
 a640c23a62f3a-abb5b020aa8mr2966866b.12.1739541504471; 
 Fri, 14 Feb 2025 05:58:24 -0800 (PST)
Received: from [192.168.126.123] ([151.49.218.237])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532580c5sm350436966b.56.2025.02.14.05.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 05:58:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH] rust: tests: do not import bindings::*
Date: Fri, 14 Feb 2025 14:58:22 +0100
Message-ID: <20250214135822.4076174-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NTO1ve3KucI_5aLgphZjGfSxL6wtokNqiTziGRf4gRI_1739541506
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.732,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 14 Feb 2025 13:58:40 -0000

Similar to the devices, spell the exact set of C functions that are
called directly.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/tests/tests.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/qemu-api/tests/tests.rs b/rust/qemu-api/tests/tests.rs
index 92dbfb8a0c8..03569e4a44c 100644
--- a/rust/qemu-api/tests/tests.rs
+++ b/rust/qemu-api/tests/tests.rs
@@ -8,13 +8,14 @@
 };
 
 use qemu_api::{
-    bindings::*,
+    bindings::{module_call_init, module_init_type, object_new, object_unref, qdev_prop_bool},
     c_str,
     cell::{self, BqlCell},
     declare_properties, define_property,
     prelude::*,
     qdev::{DeviceClass, DeviceImpl, DeviceState, Property, ResettablePhasesImpl},
     qom::{ClassInitImpl, ObjectImpl, ParentField},
+    sysbus::SysBusDevice,
     vmstate::VMStateDescription,
     zeroable::Zeroable,
 };
-- 
2.48.1


