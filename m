Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tvG1N-0001Jg-5a
	for mharc-qemu-rust@gnu.org; Thu, 20 Mar 2025 09:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvG1C-0001Fq-JB
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 09:33:09 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tvG14-0003Rc-40
 for qemu-rust@nongnu.org; Thu, 20 Mar 2025 09:33:04 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-394780e98easo474937f8f.1
 for <qemu-rust@nongnu.org>; Thu, 20 Mar 2025 06:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742477575; x=1743082375; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EcxOk5H8Mf+hivpUxneXluEV3ozaYLM9gcAGfs012Is=;
 b=uLGwHfsHBX6vpRpMcVBh5IyII1WY0kglkOaLW3Rlw2vqW/F180laGzhsEkAtKRMXsM
 OXtF0IFqMA+3SuS2O83C/w5wKTXtAx6EIFxWWCMHx/9Ul9MEec/jl5vcKjYX2Uou7lKx
 x+pRF/5UJXP6NscZ7ziysxngbDrUV403fwpaDDiJ2rAasLrBNduRHWpw4m/ljhrQorTr
 MZBdoJgITFTmT8dLZymCcbz6WqlOfyB1kt7rkihxTXAo4u4LPf2+Qon/u/BShBIeb/RS
 k3dEPeJTmvnheOYUJjS4gqKb/7/F9IMnFIBn6lY1WC4edXAlMgHA1QULGAnhm7/5kCpl
 eX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742477575; x=1743082375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EcxOk5H8Mf+hivpUxneXluEV3ozaYLM9gcAGfs012Is=;
 b=ujXYmJEhpZIHVijWAf0saRxtHSJyg6Ryjo3eYjKRG/k5STmK1f/DE+6Gl0+UBS/LJs
 CXR2KnHUlrAQdUvzxB71vFoC3NADUdMOkRNzkl74PbssRaeVMgVLw8CnOPY/zK3ogrOU
 ptNcV29mx/40vMBEzENChRsXxaNVlgmB21J0Oy+ud+h9Od3ji+pjXe69B1gefU4FchVH
 WnMwdEy/W4Z5aYQJnA4pr5Zc4+PVvl0QEfTzsMcuqFxaT7wH32bJhrzmftVapPUfAk3L
 AB9DF9yi0kKBVaaYFkrzhNUCC73NGjlEN16IANZ+71Mfqzs19+NQ90EgQhIUvTWAGUii
 jYVw==
X-Gm-Message-State: AOJu0Yw2/n/mJkSdD+YE63G+K0zAkUF0sEi+lFAHRrj6LQTLLqtWwfZ7
 Xk7Q3X/6LIBkr+TUpH5bx/iJ9ivTdeDpVRIbRCcB6FwPsIsFC5Udas5icV882vE=
X-Gm-Gg: ASbGncvF1ULjKuhMgLdjrDLDLk5L8/nYIgh5uQ+V6ShU1IFRGkhN4BaQ/5aP/k3N4I6
 q30CbyqmB5GtdWNF7TfAJUkoorpB8cNo9n0V5cbiIfRDYLt9w/lhmk1tdyHf79bxriaFAjCiYK1
 zdqfyBJJc+OHoGSuQEC0BUdcrfUmlVV3ENLpmbarGcY1x/ECM1eCUYT486QYjglqtujDo+xwL4B
 YArwZ6VJ8Q+QjEj2+AXNt0/RI4IY3ihfUv9YirQVr+7LakDK9JZ23og5FhD8JhJnMBFq9PuVS3p
 xhrqoXmmx51lw3B46Vrqf6dPwFM9AlaCU+HJF3wPnoVsL+ZciIMtiGcrtMBkHQ==
X-Google-Smtp-Source: AGHT+IFR5oINv+0Crr3f1aQU19UJw0EsirCW2cEBpooXpAcqVMvgxmK0ofGRL9Dwm9Ii1WjbK+8uww==
X-Received: by 2002:a5d:5f87:0:b0:391:43cb:43e6 with SMTP id
 ffacd0b85a97d-39973b439cemr6758857f8f.51.1742477574964; 
 Thu, 20 Mar 2025 06:32:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdeba1sm48804525e9.32.2025.03.20.06.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 06:32:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 3/3] rust: pl011: Check size of state struct at compile time
Date: Thu, 20 Mar 2025 13:32:48 +0000
Message-ID: <20250320133248.1679485-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320133248.1679485-1-peter.maydell@linaro.org>
References: <20250320133248.1679485-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 20 Mar 2025 13:33:12 -0000

The PL011 device's C implementation exposes its PL011State struct to
users of the device, and one common usage pattern is to embed that
struct into the user's own state struct.  (The internals of the
struct are technically visible to the C user of the device, but in
practice are treated as implementation details.)

This means that the Rust version of the state struct must not be
larger than the C version's struct; otherwise it will trip a runtime
assertion in object_initialize_type() when the C user attempts to
in-place initialize the type.

Add a compile-time assertion on the Rust side, so that if we
accidentally make the Rust device state larger we know immediately
that we need to expand the padding in the C version of the struct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 rust/wrapper.h                   |  1 +
 rust/hw/char/pl011/src/device.rs | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/rust/wrapper.h b/rust/wrapper.h
index d927ad6799d..d4fec546571 100644
--- a/rust/wrapper.h
+++ b/rust/wrapper.h
@@ -65,3 +65,4 @@ typedef enum memory_order {
 #include "exec/memattrs.h"
 #include "qemu/timer.h"
 #include "exec/address-spaces.h"
+#include "hw/char/pl011.h"
diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index f137b49feaf..f9b1c307289 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -2,10 +2,12 @@
 // Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-use std::{ffi::CStr, ptr::addr_of_mut};
+use std::{ffi::CStr, mem, ptr::addr_of_mut};
 
 use qemu_api::{
+    bindings,
     chardev::{CharBackend, Chardev, Event},
+    static_assert,
     impl_vmstate_forward,
     irq::{IRQState, InterruptSource},
     memory::{hwaddr, MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder},
@@ -124,6 +126,12 @@ pub struct PL011State {
     pub migrate_clock: bool,
 }
 
+// Some C users of this device embed its state struct into their own
+// structs, so the size of the Rust version must not be any larger
+// than the size of the C one. If this assert triggers you need to
+// expand the padding_for_rust[] array in the C PL011State struct.
+static_assert!(mem::size_of::<PL011State>() <= mem::size_of::<bindings::PL011State>());
+
 qom_isa!(PL011State : SysBusDevice, DeviceState, Object);
 
 #[repr(C)]
-- 
2.43.0


