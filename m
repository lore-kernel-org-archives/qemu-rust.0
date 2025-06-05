Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uN7eC-0007Xx-Mt
	for mharc-qemu-rust@gnu.org; Thu, 05 Jun 2025 06:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7dg-0007KB-Cs
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7de-0001Eo-0T
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749118557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ucBnDbok7v6Mu7KPseGvFTjV3duwh5RlIILFahRdtRA=;
 b=DbQScspqWmjKIPdhrTOJtdQeLzm1P4sLyckej8/HkRAGQYPBweWdLnZLLnjyfqXPolWE7g
 b+/KZt04G/6ceCg0/wyY1vWunMRqTYkyjG/0tUavC3ihWamKdyWAsVck7YVf+CyHyNN7Sv
 Wacxiy+cYxNeC0VHuck96fx3H62Mgpo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-UWmOZUkBOWG0Y6YplPN-Zg-1; Thu, 05 Jun 2025 06:15:56 -0400
X-MC-Unique: UWmOZUkBOWG0Y6YplPN-Zg-1
X-Mimecast-MFC-AGG-ID: UWmOZUkBOWG0Y6YplPN-Zg_1749118555
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4f6ba526eso505754f8f.1
 for <qemu-rust@nongnu.org>; Thu, 05 Jun 2025 03:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749118555; x=1749723355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ucBnDbok7v6Mu7KPseGvFTjV3duwh5RlIILFahRdtRA=;
 b=HxNCrvbl75OytEoZ1NShGmwaKdRrZDU8/sezK6wF2sMWyNHdAr/0aIgxbeItDIsepQ
 ebJeY1SmN8xVfufGP1nL085CY34VnUgJUkxm+KOxOcICcpdnKYgvQZe6eAoirpcAUTTY
 lQldV51mDw3KKHhXiOx3TOOPAMOplo9TLVVBwyz1U8HaV4sJ2O4gDMl5Az1Lp0K27y+P
 N5rtC0+a/fNI6zP/Gv6V8U0snGzkdag43XiaF7xUzow6pPvvRf+DPB12NPSK2YFl4uFI
 PzkDy2LX1Bq7TO8MiS8aS+ch/etexjfbfL+0H5JZU/Evo8kakczzlnW5+3Fe/BsZJlRB
 9yZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJEdP3ngL2XT1nm+NJ5TPn2skdyXxkZcjqXeW679B7OSxGjzeigqaOCKmkN0tpyzea0bEc+8b85uw=@nongnu.org
X-Gm-Message-State: AOJu0YwSH3Rkow2mIDrpNP6Hr5NCFB6zU4jutvctzKjWxfFG6k1Hj713
 mwHcKntzxw+eCCCrI3udx3bALK25hFk24z3cArOJ8BkeJmjAyZtcg5I/xk4tXwQd4T131CCZReI
 JlybZJu2kKwM/loRwmc3kZI4zYpn658FS+VqEcZDPh16ffMBJaeLfG/8=
X-Gm-Gg: ASbGnctpDeRdTqyLA+hDXZ3LPSAOcmvUksG3KDErxEO1gZxgnxZ9fS0sl1fbnAflZPd
 y5ummX8adnFszeK0WL/y2SAktqr8d83bx3Xp/0Ri2FVtFl1LgPE4xSQ051VeWCA/D1zw/GfQc2t
 q5jDy5R2Fi3AkYSE1f5VkDM8QGEv0xVzWI8f/Jiu5teaQ099p+0aOkEkiVe3jE81oux7Oljon7f
 2Rj6pFFym3rTxfZdpHbYlihYuZtTlrOv/aY0BJhWyKuVPmiKGxafoaTNV2Tr4hRYcYBL7vyH+X9
 offGVKNVh5gfZA==
X-Received: by 2002:a5d:64ca:0:b0:3a5:2ef8:3512 with SMTP id
 ffacd0b85a97d-3a52ef83894mr4992f8f.14.1749118554913; 
 Thu, 05 Jun 2025 03:15:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo1SKYt/CPB3qSBN3ROsyBgLxh6ojXulfyhdCgyh25NH7rh/OT6u/Oi/6im8XTguM7x//2mQ==
X-Received: by 2002:a5d:64ca:0:b0:3a5:2ef8:3512 with SMTP id
 ffacd0b85a97d-3a52ef83894mr4976f8f.14.1749118554541; 
 Thu, 05 Jun 2025 03:15:54 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451f97f797bsm20457775e9.1.2025.06.05.03.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:15:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 03/14] util/error: expose Error definition to Rust code
Date: Thu,  5 Jun 2025 12:15:32 +0200
Message-ID: <20250605101544.368953-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605101544.368953-1-pbonzini@redhat.com>
References: <20250605101544.368953-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AlWSrQ_JTU30KeTsBRnm6YO-PvdhYzbC9GoKZaxQDU0_1749118555
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
X-List-Received-Date: Thu, 05 Jun 2025 10:16:01 -0000

This is used to preserve the file and line in a roundtrip from
C Error to Rust and back to C.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qapi/error-internal.h | 26 ++++++++++++++++++++++++++
 rust/wrapper.h                |  1 +
 util/error.c                  | 10 +---------
 3 files changed, 28 insertions(+), 9 deletions(-)
 create mode 100644 include/qapi/error-internal.h

diff --git a/include/qapi/error-internal.h b/include/qapi/error-internal.h
new file mode 100644
index 00000000000..d5c3904adec
--- /dev/null
+++ b/include/qapi/error-internal.h
@@ -0,0 +1,26 @@
+/*
+ * QEMU Error Objects - struct definition
+ *
+ * Copyright IBM, Corp. 2011
+ * Copyright (C) 2011-2015 Red Hat, Inc.
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *  Markus Armbruster <armbru@redhat.com>,
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.  See
+ * the COPYING.LIB file in the top-level directory.
+ */
+
+#ifndef QAPI_ERROR_INTERNAL_H
+
+struct Error
+{
+    char *msg;
+    ErrorClass err_class;
+    const char *src, *func;
+    int line;
+    GString *hint;
+};
+
+#endif
diff --git a/rust/wrapper.h b/rust/wrapper.h
index beddd9aab2f..6060d3ba1ab 100644
--- a/rust/wrapper.h
+++ b/rust/wrapper.h
@@ -60,6 +60,7 @@ typedef enum memory_order {
 #include "hw/qdev-properties-system.h"
 #include "hw/irq.h"
 #include "qapi/error.h"
+#include "qapi/error-internal.h"
 #include "migration/vmstate.h"
 #include "chardev/char-serial.h"
 #include "exec/memattrs.h"
diff --git a/util/error.c b/util/error.c
index 673011b89e9..e5bcb7c0225 100644
--- a/util/error.c
+++ b/util/error.c
@@ -15,15 +15,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-
-struct Error
-{
-    char *msg;
-    ErrorClass err_class;
-    const char *src, *func;
-    int line;
-    GString *hint;
-};
+#include "qapi/error-internal.h"
 
 Error *error_abort;
 Error *error_fatal;
-- 
2.49.0


