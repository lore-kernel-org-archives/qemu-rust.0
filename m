Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tnw9N-0002DA-Ca
	for mharc-qemu-rust@gnu.org; Fri, 28 Feb 2025 03:55:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnw9L-0002Cd-4m
 for qemu-rust@nongnu.org; Fri, 28 Feb 2025 03:55:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnw9J-0005br-H4
 for qemu-rust@nongnu.org; Fri, 28 Feb 2025 03:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740732912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DEtBrYnRD+qhdroznCKgnXQNtSgBwOAltsGPpjAT9y8=;
 b=OOMQQI2oUvx53NbcaxBsPoR8746Wv4ZV6VQgQvutf902CgreUUXgJIQxKJkfdYACXZNuvu
 DT5dxdCQUSs4sAAI3c/CCD5SfuhblgKYSca/LSJ45245W6t6mGjEtQ1Ad5O3R+ZPKcRbxh
 MHclO3Q3O0oSU/QG96dFXzW6IPE+OFI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-bqpvEZOHO5-DZyhOPeUa9A-1; Fri, 28 Feb 2025 03:55:09 -0500
X-MC-Unique: bqpvEZOHO5-DZyhOPeUa9A-1
X-Mimecast-MFC-AGG-ID: bqpvEZOHO5-DZyhOPeUa9A_1740732908
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-438da39bb69so13205695e9.0
 for <qemu-rust@nongnu.org>; Fri, 28 Feb 2025 00:55:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740732908; x=1741337708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DEtBrYnRD+qhdroznCKgnXQNtSgBwOAltsGPpjAT9y8=;
 b=Wr76FNda4BOFT95sAvBa5j4GVt2+CaRUCCkZFAHvVyz/UHihwh1yKrG4j9/F++HX7k
 K13xIyPHcjhe+62VbV9HDf7gSzIgkuXnRnSR4FMbqvKhouVSpQawA4EEqwFvtgJb8OVh
 /kbRQe2HIClar7xe/vPM0OQkpO/UD1NRSGmsViUAgL7hdZHCwVferG6lrpomXxRo+CoC
 n4W3ziF4mhpAmPyHXQk9HyazNxwcLOvtDOjtmX7AWFQZN2tgP3ZKLMJHoWCCQLDasREM
 gwwe87SP+n2rEezWZbRRVpL8RfSvBvCBKoNEq5WoOEpDOibkKXE/Gc+D5DxWVqSEysjD
 9KDQ==
X-Gm-Message-State: AOJu0Yybp5lhagChc2OPVARKVZpOB180eLmmIYQfqoeLZ6AbF0dTBU+d
 ZfOjddBjAIC13YlHMzRlkr3e8Td3AG/CRdGOn3pm8slWeoFcy1COHCsAhvscs/O9S3rbmnp7F++
 pjVC1KJGZeYTIAipNm8BHUlcthZQnASOwl0bWCv5mQdSBp3rn/EY=
X-Gm-Gg: ASbGnctcEn5VYXl5HdwES6kODPvPWizj37C47l1ETJ65JG9lca3kwSBNt4jloUYnCE7
 +CmvlJKK1FNUh0TPcGZM0rZ6VaNuS7JxJzB2iY07pgRbQZjkvemCshd9u4MiCr/ueY54v0CgsTl
 kOvLfqyIdYrf5n/ZKgnntgMXFakisQOU9swN7TsXysz8gfXEpXDlhSNhPweXXULl58I7e+Pb+iS
 WdNmdVQwf/A8snmFxdtbDJENDsKTLOo1xic1t+pWJbVxpYAPFbnw5MurR7AQXvqFUYtnarnYJmO
 7AJzBqh65rJZkzhsZ07l
X-Received: by 2002:a05:600c:19c7:b0:439:6b57:c68 with SMTP id
 5b1f17b1804b1-43ba6710a51mr20982485e9.17.1740732908416; 
 Fri, 28 Feb 2025 00:55:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1QxGOsl/WH8Cfj/UOdbIGiyjrlJuhFBmYecfclwvc/h17QG+Y7cG0SAUNqgbWVopwIqDy2g==
X-Received: by 2002:a05:600c:19c7:b0:439:6b57:c68 with SMTP id
 5b1f17b1804b1-43ba6710a51mr20982245e9.17.1740732908022; 
 Fri, 28 Feb 2025 00:55:08 -0800 (PST)
Received: from [192.168.10.48] ([151.95.152.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba52b7ecsm80611535e9.3.2025.02.28.00.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 00:55:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH] rust: cell: add full example of declaring a SysBusDevice
Date: Fri, 28 Feb 2025 09:55:06 +0100
Message-ID: <20250228085506.846381-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9rYRdpRkC2Rje8LBtiLqnPSr0SZAnxJZ3Et8_zv-_8c_1740732908
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
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
X-List-Received-Date: Fri, 28 Feb 2025 08:55:15 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/cell.rs | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/rust/qemu-api/src/cell.rs b/rust/qemu-api/src/cell.rs
index 6db678161ff..13e267ad355 100644
--- a/rust/qemu-api/src/cell.rs
+++ b/rust/qemu-api/src/cell.rs
@@ -73,6 +73,36 @@
 //! QEMU device implementations is usually incorrect and can lead to
 //! thread-safety issues.
 //!
+//! ### Example
+//!
+//! ```
+//! # use qemu_api::prelude::*;
+//! # use qemu_api::{c_str, cell::BqlRefCell, irq::InterruptSource, irq::IRQState};
+//! # use qemu_api::{sysbus::SysBusDevice, qom::Owned, qom::ParentField};
+//! # const N_GPIOS: usize = 8;
+//! # struct PL061Registers { /* ... */ }
+//! # unsafe impl ObjectType for PL061Device {
+//! #     type Class = <SysBusDevice as ObjectType>::Class;
+//! #     const TYPE_NAME: &'static std::ffi::CStr = c_str!("pl061");
+//! # }
+//! struct PL061Device {
+//!     parent_obj: ParentField<SysBusDevice>,
+//!
+//!     // Configuration is read-only after initialization
+//!     pullups: u32,
+//!     pulldowns: u32,
+//!
+//!     // Same for sub-objects of the device
+//!     out: [Owned<IRQState>; N_GPIOS],
+//!
+//!     // Single values shared with C code use BqlCell, in this case via InterruptSource
+//!     interrupt: InterruptSource,
+//!
+//!     // Larger state accessed by device methods uses BqlRefCell or Mutex
+//!     registers: BqlRefCell<PL061Registers>,
+//! }
+//! ```
+//!
 //! ### `BqlCell<T>`
 //!
 //! [`BqlCell<T>`] implements interior mutability by moving values in and out of
-- 
2.48.1


