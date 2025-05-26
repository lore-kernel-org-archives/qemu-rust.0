Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJYlp-00037i-Da
	for mharc-qemu-rust@gnu.org; Mon, 26 May 2025 10:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlM-0002uT-1P
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlK-0007q3-5j
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748269509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ucBnDbok7v6Mu7KPseGvFTjV3duwh5RlIILFahRdtRA=;
 b=Ci2so8eoE964A4mvBBP/KgNjuLNFmoKCD+JihXnBxjMk/E8IGNE6VN36HH/f2QPHDuBVry
 hMnw/DOfRiKnT/7nr5zTpKTODIGuN/yOo0zyYnFWmgi4o7rZFUw1ts3UoBgEu4wLYFtpNL
 gUjuxgGrf+avPISD7AYT5a0vsdbz3jk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-V0WUsTXqP1uB71X_-vWLwQ-1; Mon, 26 May 2025 10:25:07 -0400
X-MC-Unique: V0WUsTXqP1uB71X_-vWLwQ-1
X-Mimecast-MFC-AGG-ID: V0WUsTXqP1uB71X_-vWLwQ_1748269507
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43ea256f039so18194305e9.0
 for <qemu-rust@nongnu.org>; Mon, 26 May 2025 07:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748269506; x=1748874306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ucBnDbok7v6Mu7KPseGvFTjV3duwh5RlIILFahRdtRA=;
 b=M1DX/dqXzsdypofpdYZJTRRAIBzHUcMgiIZVYS1bKlvI6w8wEpFKLDKZOdGZE3Ct+q
 MohtXC8VcdajR1n3q8qNzlaRRu0igDK+M9wYu7noyERXkkGAUMj7I1JC4ocp9z92fi2C
 QVhTx9N1PTycTrrj7jI6v4p+GqWDGZ9DaxL4PYjmpNoeA7IC3sBhx5IQivNOvjnn950t
 kXE4LM3bHvEuSlk8piw/lqQiFCzyi/FqTWMy4m1jPkjRgxCUow3Ug8IMMIj1GlM1EmAZ
 H6tTJUIyhyi3XeZSjoxm4wBH952L+niaQj8RkMbZybKrLBI9zBykqYP3NtALXGquEfeH
 W9Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAenuhdfqfzbQlA02Enjqen5o2ampxvtZfhXlyd16iJeiPDBGtr5hiGHnKCuCLuj6dnjFZu3Hm62k=@nongnu.org
X-Gm-Message-State: AOJu0YxjkiBFV3Smi+40dLufvZAgUoT4iyDn42DrAb7bLh0/qZb8nrRI
 Qst5JiVG5Fgvcno3Q+RN26wI4V2VWp34WjoZv5nG/u4LmoTbVWCV9MU6s5WqCj1d1QG0uU3uRsO
 6oxl6tD/iO5yG48N73BcWj51Rr6637PMMiaaQyd7K8pFKHB2DLgNKqKoYzVPun+Q=
X-Gm-Gg: ASbGncsbTUil7SaiScUSe83BA4iX//cQv9e4soLi476hFPaJeQMZHjonK6DEtxmTLNi
 O3lxD01HBa4UyZc6siqtTvpxghDzGiUGt34hRTUAVcQNjbmFkiikx9vLe+cyJXlt3Iy4897y6Ep
 J0wuz+nmmLUtIve3nYw7rPOrUVxM3CXmmQ17LR//tqrIRBUxzQf5uO2NpN3sfdGfOgfhHhVtb+W
 0wgAtgfjuR3IrSYq6928c+nlQd6sqdOSRvmaNL/kr5SK1nVpWQwklFVpi6wQwWYX95uI3uO14D2
 +ZPyBSQomShfwg==
X-Received: by 2002:a05:600c:1d0d:b0:43c:f44c:72a6 with SMTP id
 5b1f17b1804b1-44c9160702fmr93560295e9.2.1748269506358; 
 Mon, 26 May 2025 07:25:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF4prXa7demfxOifhhcdzpzGpK3l+oYECeyNWEqlGlLWMYhrm6WWLfbf5CyRl6gHIbHjLr/g==
X-Received: by 2002:a05:600c:1d0d:b0:43c:f44c:72a6 with SMTP id
 5b1f17b1804b1-44c9160702fmr93560005e9.2.1748269505868; 
 Mon, 26 May 2025 07:25:05 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4c8455e7dsm8965827f8f.9.2025.05.26.07.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 07:25:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 04/12] util/error: expose Error definition to Rust code
Date: Mon, 26 May 2025 16:24:47 +0200
Message-ID: <20250526142455.1061519-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526142254.1061009-1-pbonzini@redhat.com>
References: <20250526142254.1061009-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ecIb2X_hXAzlrD4o6Xkq12sxkxKye46beuUeWbFBGZ0_1748269507
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.903,
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
X-List-Received-Date: Mon, 26 May 2025 14:25:27 -0000

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


