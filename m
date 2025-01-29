Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1td3ZX-0002wx-KN
	for mharc-qemu-rust@gnu.org; Wed, 29 Jan 2025 03:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1td3ZW-0002wA-AS
 for qemu-rust@nongnu.org; Wed, 29 Jan 2025 03:37:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1td3ZU-0006WX-Mq
 for qemu-rust@nongnu.org; Wed, 29 Jan 2025 03:37:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738139836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3kI2fmnmJgUGnjqtQ5jhxKS9I/PiFpAzsz1KC537irc=;
 b=cR2hce4GjOSWgj+Z4Db1LhDiEYv5jgzmRmaRRBKgjyUp4BTAdXC0u+4IfBwHRnsP8llyJP
 JD2b9j8LZwltqSlQeG9CZM1ZlzIZx/RElOUj0xHcQvj25UQRjJeL2DAcJNdTZwZkbTmUcV
 ho/FEAsPWNhavqOpcUAqyKiMvn1FVLo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-4Ob0Q1M_MWyUW9nAbXogLw-1; Wed, 29 Jan 2025 03:37:14 -0500
X-MC-Unique: 4Ob0Q1M_MWyUW9nAbXogLw-1
X-Mimecast-MFC-AGG-ID: 4Ob0Q1M_MWyUW9nAbXogLw
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38bee9ae3b7so4295373f8f.1
 for <qemu-rust@nongnu.org>; Wed, 29 Jan 2025 00:37:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738139833; x=1738744633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3kI2fmnmJgUGnjqtQ5jhxKS9I/PiFpAzsz1KC537irc=;
 b=bVvgFiziKmnDALclpHf9ec+nITJhSKde08vN5PN+f3FyFqUlDb2j70N8x7nePmY3z5
 Ql6XxJjfHSAdeZ1uhjFcGdct9yBjnn3UO8WEHbYguKuFOADqao4XwPoJF7h+n/uvRvG/
 ri2BbPdCHWfwXz+SBOEpDa5VRl2wyV/Ag6VW0Xos9EUja7poIjLS2ijVAv99OvLBPiIl
 YMIxJPmSSz2wg290AJeq1DsZDdXvWK0ezCo6ATFIuMgqSjMQ1hQ0xIO5ISp4eEt5bAq+
 Sv41iC20uw45bIwi+0dHANpRTeFAZcSIq+cWZxPIXBnNH8pTXIuvys2QV+JPdI4OnAId
 I/6A==
X-Gm-Message-State: AOJu0Ywvx1iGVUqzJh9LdHj9UFuW1AnhuwA1oku+tiiZ4mnCufO4ZUWi
 NF/joFXm8GYp2H+Sl8NIx3pnFadNHEvtlRm7VdBYa1qLXU6/81XmuzsIXnNRf+LUZRcuAyz69XS
 tNzJKXWhFfp6ydlBvD6diovQzhi6di2UY6yt0NECJrYlG0Wswb41S8I+NLeEW9A==
X-Gm-Gg: ASbGnct2uIn6RO+OoHVzNvYJLNbdltUF4OTT3CPKtdm9PPpG7RrZj1WK5NZfst1Wzb3
 WT0eHuEDUkDa79+86/poHrvOJICmC8ljuSnnCP0Qoc+gPsMQeJSfc9DBLLViBnBlyVsL7JEKohf
 hyonHf1AZ0tI+6yqBHyVzApEKockCPiw4tw1LptLdsxyTnwgitSa/NmQzba8xo7MWUKflQLh6QU
 xkixqQsquiXOVij4HIJCMYU/V0V8Gv18Lulx4BQtIAUSw/LtdiQ6RNqRDv9f78ui77j0cZmZPsV
 8erSyg==
X-Received: by 2002:a5d:64ec:0:b0:386:3e87:2cd6 with SMTP id
 ffacd0b85a97d-38c5209018cmr1720062f8f.38.1738139832904; 
 Wed, 29 Jan 2025 00:37:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvvrO4BLXQh9+pbCl+W9wYsMvVqRAEChnfpEN5RzNO87Anj0E6WrQQjnhiBH+RSt9V0/6zfQ==
X-Received: by 2002:a5d:64ec:0:b0:386:3e87:2cd6 with SMTP id
 ffacd0b85a97d-38c5209018cmr1720043f8f.38.1738139832485; 
 Wed, 29 Jan 2025 00:37:12 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc13202sm14625905e9.5.2025.01.29.00.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 00:37:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 2/2] rust: include rust_version in Cargo.toml
Date: Wed, 29 Jan 2025 09:37:04 +0100
Message-ID: <20250129083705.1321407-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129083705.1321407-1-pbonzini@redhat.com>
References: <20250129083705.1321407-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P15BKvgAS69MfcJQD84Du8sNRvskuRM2eAM8GZ49fUo_1738139833
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 29 Jan 2025 08:37:18 -0000

Tell clippy the minimum supported Rust version for QEMU.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/Cargo.toml          | 1 +
 rust/hw/char/pl011/src/device_class.rs | 1 -
 rust/qemu-api-macros/Cargo.toml        | 1 +
 rust/qemu-api/Cargo.toml               | 1 +
 4 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/rust/hw/char/pl011/Cargo.toml b/rust/hw/char/pl011/Cargo.toml
index 2b4097864df..f2296cad58b 100644
--- a/rust/hw/char/pl011/Cargo.toml
+++ b/rust/hw/char/pl011/Cargo.toml
@@ -9,6 +9,7 @@ resolver = "2"
 publish = false
 keywords = []
 categories = []
+rust-version = "1.63.0"
 
 [lib]
 crate-type = ["staticlib"]
diff --git a/rust/hw/char/pl011/src/device_class.rs b/rust/hw/char/pl011/src/device_class.rs
index 8a157a663fb..dbef93f6cb3 100644
--- a/rust/hw/char/pl011/src/device_class.rs
+++ b/rust/hw/char/pl011/src/device_class.rs
@@ -12,7 +12,6 @@
 
 use crate::device::{PL011Registers, PL011State};
 
-#[allow(clippy::missing_const_for_fn)]
 extern "C" fn pl011_clock_needed(opaque: *mut c_void) -> bool {
     let state = NonNull::new(opaque).unwrap().cast::<PL011State>();
     unsafe { state.as_ref().migrate_clock }
diff --git a/rust/qemu-api-macros/Cargo.toml b/rust/qemu-api-macros/Cargo.toml
index b9b4baecddb..89dee1cfb39 100644
--- a/rust/qemu-api-macros/Cargo.toml
+++ b/rust/qemu-api-macros/Cargo.toml
@@ -9,6 +9,7 @@ resolver = "2"
 publish = false
 keywords = []
 categories = []
+rust-version = "1.63.0"
 
 [lib]
 proc-macro = true
diff --git a/rust/qemu-api/Cargo.toml b/rust/qemu-api/Cargo.toml
index 4aa22f31986..a51dd142852 100644
--- a/rust/qemu-api/Cargo.toml
+++ b/rust/qemu-api/Cargo.toml
@@ -12,6 +12,7 @@ resolver = "2"
 publish = false
 keywords = []
 categories = []
+rust-version = "1.63.0"
 
 [dependencies]
 qemu_api_macros = { path = "../qemu-api-macros" }
-- 
2.48.1


