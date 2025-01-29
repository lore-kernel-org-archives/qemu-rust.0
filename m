Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1td3ZV-0002vp-A8
	for mharc-qemu-rust@gnu.org; Wed, 29 Jan 2025 03:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1td3ZT-0002v3-Ej
 for qemu-rust@nongnu.org; Wed, 29 Jan 2025 03:37:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1td3ZR-0006Vr-L7
 for qemu-rust@nongnu.org; Wed, 29 Jan 2025 03:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738139833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lf4c6h56xYCNge6XjLmVtzeXRglB5fuipR2Vwz8DQLs=;
 b=UlaP98gzQVngd5YWBIp1HVnhi8z+ZdI24U2H3kPTQ9V8YFpj/3roj0i4+qZ7kVbUeE/6XU
 XvFTvJZa23x+NjludNbKVeZo22YYgh+Sl0utaGdkfTYlGVWQAbOePLFFlN82Oa2K4FaCMb
 +iYuEajrVn9Z3HnAK+Mde+FOV9w/Ofo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-49K6rVNGNyijU5R2DZZeaA-1; Wed, 29 Jan 2025 03:37:11 -0500
X-MC-Unique: 49K6rVNGNyijU5R2DZZeaA-1
X-Mimecast-MFC-AGG-ID: 49K6rVNGNyijU5R2DZZeaA
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4361ecebc5bso33179275e9.1
 for <qemu-rust@nongnu.org>; Wed, 29 Jan 2025 00:37:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738139830; x=1738744630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lf4c6h56xYCNge6XjLmVtzeXRglB5fuipR2Vwz8DQLs=;
 b=t4mKfxWnF8SFRMinbc6AlwSfIQMzeh+765fi98mbkY/JG4sbS1E8dWEAcamryvfN7R
 moH5+JWLYuMJXsq5PTxiRNjhkY6FK6Fyhvdzn/R7rSh2lEuH7cpNJa5yeJrozMVIGVOO
 DtOrOIi1ZgSVeNIG1rMmcWj1OPHbxoUqTqLF6hPW3tP+K7F7tKxmRggG3JSj7OSKaAqI
 34w04gtu0nS2qFXqcRGBD162fvbtH5oLqEDd66yYDcjPlUmMDA1DQ71IDGIhEQws2HqK
 63rNX1YHtN3PMPBh3j60n94YbQWGOXnfu4Jnab4wNwwImxtDDH0DDTkvjN1ktS7xraM7
 ExCQ==
X-Gm-Message-State: AOJu0YyhNQrSwp+78UZE88zbHceypY/7FeOAYp889RhF7EDT0/PuMVV+
 j1uXnpZ5e7573PQFpVthCpT6W2IuiNT5bWxLBJ3MozRj3dr7Ny666mGf4uRoAVSsOI43qt3r+lY
 jwL8sBq9F8kG516860ZXIEsTcehffGH3bgk+rnDvS4/zPEGHgFNMZsCsG4KSa4Q==
X-Gm-Gg: ASbGncu5iYA0f9ur/smsBRTTONfXlQSaBbe71/lNml47HWKNciJMUsdq1Nx8eqI6TVS
 ted+uTiPi+Zwroqk6RHSowjx9a8Chl3MplyWvtfd1a37I8KVys1cr+qZFCopb9wnBaqboqcSiYa
 aYpKyJWX/OFgw2Fy8sZdxuJUdjxO11miaJMQQdRQgPCBhAFE1S5oxe5Catr1LA2Scv6Hk+LHBKF
 6bI0g1jzRthDQpkShaL9StOZiO0a5NhUqHCVZJaaM5DLCi/GMHHCwo/TjjA5Yn9BuMuBpXWJ554
 OaDZuw==
X-Received: by 2002:a05:600c:1d1e:b0:431:5e3c:2ff0 with SMTP id
 5b1f17b1804b1-438dc3bd896mr16331245e9.8.1738139830006; 
 Wed, 29 Jan 2025 00:37:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0oTdCksnKM5Ry20svhj0xsJ1mBq1bwn5vByG9CcgFXtBiJpLbwjMnEpORx25ZVJThaToxEQ==
X-Received: by 2002:a05:600c:1d1e:b0:431:5e3c:2ff0 with SMTP id
 5b1f17b1804b1-438dc3bd896mr16331035e9.8.1738139829654; 
 Wed, 29 Jan 2025 00:37:09 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm14240565e9.37.2025.01.29.00.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 00:37:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 1/2] rust: remove unnecessary Cargo.toml metadata
Date: Wed, 29 Jan 2025 09:37:03 +0100
Message-ID: <20250129083705.1321407-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129083705.1321407-1-pbonzini@redhat.com>
References: <20250129083705.1321407-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DTCQTGF_-wz1yYfnXYUtS27T5W-iqn5KlpqezpUKPKk_1738139830
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 29 Jan 2025 08:37:15 -0000

Some items of Cargo.toml (readme, homepage, repository) are
only present because of clippy::cargo warnings being enabled in
rust/hw/char/pl011/src/lib.rs.  But these items are not
particularly useful and would be all the same for all Cargo.toml
files in the QEMU workspace.  Clean them up.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/Cargo.toml   |  3 ---
 rust/hw/char/pl011/README.md    | 31 -------------------------------
 rust/hw/char/pl011/src/lib.rs   | 14 ++++++--------
 rust/qemu-api-macros/Cargo.toml |  3 ---
 rust/qemu-api-macros/README.md  |  1 -
 5 files changed, 6 insertions(+), 46 deletions(-)
 delete mode 100644 rust/hw/char/pl011/README.md
 delete mode 100644 rust/qemu-api-macros/README.md

diff --git a/rust/hw/char/pl011/Cargo.toml b/rust/hw/char/pl011/Cargo.toml
index 58f3e859f7e..2b4097864df 100644
--- a/rust/hw/char/pl011/Cargo.toml
+++ b/rust/hw/char/pl011/Cargo.toml
@@ -4,10 +4,7 @@ version = "0.1.0"
 edition = "2021"
 authors = ["Manos Pitsidianakis <manos.pitsidianakis@linaro.org>"]
 license = "GPL-2.0-or-later"
-readme = "README.md"
-homepage = "https://www.qemu.org"
 description = "pl011 device model for QEMU"
-repository = "https://gitlab.com/epilys/rust-for-qemu"
 resolver = "2"
 publish = false
 keywords = []
diff --git a/rust/hw/char/pl011/README.md b/rust/hw/char/pl011/README.md
deleted file mode 100644
index cd7dea31634..00000000000
--- a/rust/hw/char/pl011/README.md
+++ /dev/null
@@ -1,31 +0,0 @@
-# PL011 QEMU Device Model
-
-This library implements a device model for the PrimeCell® UART (PL011)
-device in QEMU.
-
-## Build static lib
-
-Host build target must be explicitly specified:
-
-```sh
-cargo build --target x86_64-unknown-linux-gnu
-```
-
-Replace host target triplet if necessary.
-
-## Generate Rust documentation
-
-To generate docs for this crate, including private items:
-
-```sh
-cargo doc --no-deps --document-private-items --target x86_64-unknown-linux-gnu
-```
-
-To include direct dependencies like `bilge` (bitmaps for register types):
-
-```sh
-cargo tree --depth 1 -e normal --prefix none \
- | cut -d' ' -f1 \
- | xargs printf -- '-p %s\n' \
- | xargs cargo doc --no-deps --document-private-items --target x86_64-unknown-linux-gnu
-```
diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
index e2df4586bcc..e704daf6e3e 100644
--- a/rust/hw/char/pl011/src/lib.rs
+++ b/rust/hw/char/pl011/src/lib.rs
@@ -1,13 +1,12 @@
 // Copyright 2024, Linaro Limited
 // Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
 // SPDX-License-Identifier: GPL-2.0-or-later
-//
-// PL011 QEMU Device Model
-//
-// This library implements a device model for the PrimeCell® UART (PL011)
-// device in QEMU.
-//
-#![doc = include_str!("../README.md")]
+
+//! PL011 QEMU Device Model
+//!
+//! This library implements a device model for the PrimeCell® UART (PL011)
+//! device in QEMU.
+//!
 //! # Library crate
 //!
 //! See [`PL011State`](crate::device::PL011State) for the device model type and
@@ -18,7 +17,6 @@
     clippy::suspicious,
     clippy::complexity,
     clippy::perf,
-    clippy::cargo,
     clippy::nursery,
     clippy::style
 )]
diff --git a/rust/qemu-api-macros/Cargo.toml b/rust/qemu-api-macros/Cargo.toml
index 5a27b52ee6e..b9b4baecddb 100644
--- a/rust/qemu-api-macros/Cargo.toml
+++ b/rust/qemu-api-macros/Cargo.toml
@@ -4,10 +4,7 @@ version = "0.1.0"
 edition = "2021"
 authors = ["Manos Pitsidianakis <manos.pitsidianakis@linaro.org>"]
 license = "GPL-2.0-or-later"
-readme = "README.md"
-homepage = "https://www.qemu.org"
 description = "Rust bindings for QEMU - Utility macros"
-repository = "https://gitlab.com/qemu-project/qemu/"
 resolver = "2"
 publish = false
 keywords = []
diff --git a/rust/qemu-api-macros/README.md b/rust/qemu-api-macros/README.md
deleted file mode 100644
index f60f54ac4be..00000000000
--- a/rust/qemu-api-macros/README.md
+++ /dev/null
@@ -1 +0,0 @@
-# `qemu-api-macros` - Utility macros for defining QEMU devices
-- 
2.48.1


