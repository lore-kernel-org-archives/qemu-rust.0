Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tKd1R-0003y5-Sp
	for mharc-qemu-rust@gnu.org; Mon, 09 Dec 2024 07:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd1D-0003pG-1t
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tKd15-0007PD-Gw
 for qemu-rust@nongnu.org; Mon, 09 Dec 2024 07:37:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733747853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OshVopfsDLXhXQaf0FN9QUClgxDd1xn/z3ig2ZaD5Nc=;
 b=Q733FEqkRGdve5ZcMwW2ytKEFX7LQ3DsKz9R5AU/lc5bb5hPVdVyVAzAWEdV7yOEHnMXqQ
 hvbsrlFefVhStxrh/yC+QfsDpfuk5CTJc0ATF0qxOs0+5wiOMtrNH0rLDGZ1WjahxDNTrr
 S7G6690z2XEd6ZaGDdvBEtf6uAs6XYM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-0DNhI-9lO7yFvWT_Y_RSow-1; Mon, 09 Dec 2024 07:37:30 -0500
X-MC-Unique: 0DNhI-9lO7yFvWT_Y_RSow-1
X-Mimecast-MFC-AGG-ID: 0DNhI-9lO7yFvWT_Y_RSow
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-434edbbc3a7so14744685e9.3
 for <qemu-rust@nongnu.org>; Mon, 09 Dec 2024 04:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733747849; x=1734352649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OshVopfsDLXhXQaf0FN9QUClgxDd1xn/z3ig2ZaD5Nc=;
 b=Qca/f1PazLUshuVVXxr7792ayDqUS7GavJ9uVl61suPVwyhk4JUQ/PBmVnGp6XPYT5
 zvcOHQyroo+jX2+NsOZAkxXmu1trjn9zNFu13w00m9AFS/SZ4SbUcH4Cg+HjbhwiWuUu
 Q721JxJj8lvSAhiJQPbwwo/PKQ+i+f86OcUHuAaRl/skjkY4yZbQ56U1+X5ftGp6ROQb
 dOIzgx5z1uc7hkziQ/5z81Z6wTbBR2tS1chOCWR1xYZzXZsJ5E4TBSBuznjdzCGFFRrK
 eAgZzQmItmbDzgRCOb/i+dgEHZbnHSy8Jbwz07ciO41hdKA3m0PM1JuffSfz5wwDvgU/
 QpSw==
X-Gm-Message-State: AOJu0YzBTB3hhJGeYZ4ie5ZZ3wpzGff06T6Y/rjBSi8R07ZA+tS/UNHu
 CwmXMLoLT2KXFl52usN7ZKLlU6XOZYMYAQDyAk+8SGKAQBVYE/oUeFrmHm2WjddRszjHXEhavwg
 4/xNYEbFH67BHDY+FevIsPk0sbFOcl6WvX6/s0LEe3+gMnosRo/A=
X-Gm-Gg: ASbGncu6qrj0VGRh4ftSXUXSsQ1KwNKe3AK92k2eCWGOyp3Ci6lZFxw/+K9nTbbxBQd
 baQt1ck2sWKSlvvYDZSxecbpx2vTN6foS2eb1mNPOkw+BzDi3RzGsQxxwQOse0DPAXZdNlVdhdL
 5sTm1RzDmljisuTX+IhiOqHnSV6eBqWPqBKJGACUWphTp6+PCuuzvcFUfo4rLTYpPo7kyK4KlYT
 ntA0GAC6W7qpSUMxIyZbXXVD8SLKN/7SRWzcaHQfePro/cJVGh6Hw==
X-Received: by 2002:a05:600c:218b:b0:434:e8cf:6390 with SMTP id
 5b1f17b1804b1-434e8cf6549mr58800685e9.6.1733747849186; 
 Mon, 09 Dec 2024 04:37:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHlEgkoznpcJBVMGo3GWGVCxSEwTQXhhE5t4h73rLaMp1i9fY4c8mflKhLCQexfBFrkVKgTQ==
X-Received: by 2002:a05:600c:218b:b0:434:e8cf:6390 with SMTP id
 5b1f17b1804b1-434e8cf6549mr58800475e9.6.1733747848846; 
 Mon, 09 Dec 2024 04:37:28 -0800 (PST)
Received: from [192.168.10.47] ([151.81.118.45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434ea285b57sm82152305e9.37.2024.12.09.04.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 04:37:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Junjie Mao <junjie.mao@hotmail.com>
Subject: [PATCH 04/26] rust: define prelude
Date: Mon,  9 Dec 2024 13:36:55 +0100
Message-ID: <20241209123717.99077-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209123717.99077-1-pbonzini@redhat.com>
References: <20241209123717.99077-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kcwB67Nduxb3MTrgwM_ZLtErMsGgYfnNh7KistTTSD0_1733747849
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.489,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Mon, 09 Dec 2024 12:37:49 -0000

Add a module that will contain frequently used traits and
occasionally structs.  They can be included quickly with
"use qemu_api::prelude::*".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/meson.build    | 1 +
 rust/qemu-api/src/lib.rs     | 5 +++++
 rust/qemu-api/src/prelude.rs | 6 ++++++
 3 files changed, 12 insertions(+)
 create mode 100644 rust/qemu-api/src/prelude.rs

diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index cacb112c5c3..f8b4cd39a26 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -21,6 +21,7 @@ _qemu_api_rs = static_library(
       'src/definitions.rs',
       'src/device_class.rs',
       'src/offset_of.rs',
+      'src/prelude.rs',
       'src/vmstate.rs',
       'src/zeroable.rs',
     ],
diff --git a/rust/qemu-api/src/lib.rs b/rust/qemu-api/src/lib.rs
index b04d110b3f5..e5956cd5eb6 100644
--- a/rust/qemu-api/src/lib.rs
+++ b/rust/qemu-api/src/lib.rs
@@ -7,6 +7,11 @@
 #[rustfmt::skip]
 pub mod bindings;
 
+// preserve one-item-per-"use" syntax, it is clearer
+// for prelude-like modules
+#[rustfmt::skip]
+pub mod prelude;
+
 pub mod c_str;
 pub mod cell;
 pub mod definitions;
diff --git a/rust/qemu-api/src/prelude.rs b/rust/qemu-api/src/prelude.rs
new file mode 100644
index 00000000000..dfaddbd062a
--- /dev/null
+++ b/rust/qemu-api/src/prelude.rs
@@ -0,0 +1,6 @@
+// Copyright 2024 Red Hat, Inc.
+// Author(s): Paolo Bonzini <pbonzini@redhat.com>
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+pub use crate::cell::BqlCell;
+pub use crate::cell::BqlRefCell;
-- 
2.47.1


