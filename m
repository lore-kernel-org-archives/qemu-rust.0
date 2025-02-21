Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tlWRZ-0006rP-9G
	for mharc-qemu-rust@gnu.org; Fri, 21 Feb 2025 12:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRQ-0006kM-E4
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:03:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRN-0001OU-Ca
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:03:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740157432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1nJY4+DKOnRdgOSJbixQgGwalcHO4gTnjYN+sbdUtTI=;
 b=HSXeM2gk2XOpMqStjX/IjTXYcOm4cEv3fPz8svzoLyaWUNq4X+y6FJBIWjQ1sTbdRDpadt
 byk1q5YREpbM8O5Td2bWAzWEDgJbIsp7Q2bDk80TSvdoMssJ9J31LEs1GNfRQPCfHYFQ16
 p4lqpFvFDNVgi28E5ywXwj98pJr7wMk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-cZKQPOveM5Gmyehnhpf4nw-1; Fri, 21 Feb 2025 12:03:50 -0500
X-MC-Unique: cZKQPOveM5Gmyehnhpf4nw-1
X-Mimecast-MFC-AGG-ID: cZKQPOveM5Gmyehnhpf4nw_1740157429
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38f2ef5f0dbso975247f8f.2
 for <qemu-rust@nongnu.org>; Fri, 21 Feb 2025 09:03:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740157428; x=1740762228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1nJY4+DKOnRdgOSJbixQgGwalcHO4gTnjYN+sbdUtTI=;
 b=An1tDmvpqRD/ZdpAVnUHRREHlddMyubxFMt9d756ezGZiYK2LXttW6qXB7bQUK0rqL
 WAvXU9nEIcp5QBRDEAHnsAoh1rOA64ts1S8GxU+T3C0miQ2R4zLL6ot5WblD62UjU7mq
 zc7hpFTf2HS6Wv7GCvRJddTYwR3I+VLQughVmYGcn2CJCusD8ETNwGFtiwUZVJ7JV8ak
 3lHxDCNO9kuRsKNeiWYlqMTOo3cjp7fXF6dKrnDh3O2d+I/qRizhck5U6WfPkJhD7Vx/
 NhFa/2BYt6MlGd0z6nZeUVa298wj0mPtIrnbQFpOsAFUBb8uVB2ioVMsVkCWlnakczcw
 ADFQ==
X-Gm-Message-State: AOJu0YwMm8QHTMEXxEBbRpxsQcjsGzuFaWVkRgipew8/lMsP4c4HqrY1
 HP1Bl9LlRIonlUlpFdGYKzrPyImofIK0WRXtMitUR/u0F8SlySbWt+FkXEu14PywBPf3EbTEofO
 ubeLSmKnczfMm2U6vQDGWflJQOXTHS+47jRyxJVbiYIx6v4xj1mYRJRxUh1D3Kg==
X-Gm-Gg: ASbGncvrHkzXvmDm8O4YHufkiEh0UD14SvgAsuIQnNbOuC5AkYy49+RynSPz3K6ZFfi
 pSzkN1A92PL63OpxUkC8WhnyXHuUkxAhiYGmoNQyj5fWsyNbMm6+1TNxhEWTVzjosbzY/2APZYz
 vMDyZTaCMzkx2mrPwHGuPv3ENsq4BxfGAGujkapCqBgxYxeon0u9UAUOjX3qwIpOOc4q3ys2V9a
 TumiC+cT8XuGp7D2FMgqMYa2acAdhM4upF65sTXwJSc2WaFAEzMm6vGX6AKvUDTv366VHlYOLbD
 /0pZ13/mPc6gFSlAxhU=
X-Received: by 2002:a5d:4e87:0:b0:38d:a879:4778 with SMTP id
 ffacd0b85a97d-38f6f0529bbmr3684289f8f.33.1740157428436; 
 Fri, 21 Feb 2025 09:03:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHSCdTAjM6t/EsZj2CvLBtQmF/ZHcMG+AKfYF+Hr94UnN5YaIxc7Z5J3yJYVGY+iuVXnIRcg==
X-Received: by 2002:a5d:4e87:0:b0:38d:a879:4778 with SMTP id
 ffacd0b85a97d-38f6f0529bbmr3684039f8f.33.1740157426446; 
 Fri, 21 Feb 2025 09:03:46 -0800 (PST)
Received: from [192.168.10.48] ([151.95.61.185])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f5b38sm22973835e9.24.2025.02.21.09.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 09:03:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 02/15] rust: add SysBusDeviceImpl
Date: Fri, 21 Feb 2025 18:03:29 +0100
Message-ID: <20250221170342.63591-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221170342.63591-1-pbonzini@redhat.com>
References: <20250221170342.63591-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m2IALG0cHFjK6dTECOXhcEl-ddENux-xGw0UlR8I2XA_1740157429
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.424,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 21 Feb 2025 17:04:02 -0000

The only function, right now, is to ensure that anything with a
SysBusDeviceClass class is a SysBusDevice.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs | 5 ++++-
 rust/hw/timer/hpet/src/hpet.rs   | 4 +++-
 rust/qemu-api/src/sysbus.rs      | 8 +++++---
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index fe73771021e..7063b60c0cc 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -20,7 +20,7 @@
     prelude::*,
     qdev::{Clock, ClockEvent, DeviceImpl, DeviceState, Property, ResetType, ResettablePhasesImpl},
     qom::{ClassInitImpl, ObjectImpl, Owned, ParentField},
-    sysbus::{SysBusDevice, SysBusDeviceClass},
+    sysbus::{SysBusDevice, SysBusDeviceClass, SysBusDeviceImpl},
     vmstate::VMStateDescription,
 };
 
@@ -176,6 +176,8 @@ impl ResettablePhasesImpl for PL011State {
     const HOLD: Option<fn(&Self, ResetType)> = Some(Self::reset_hold);
 }
 
+impl SysBusDeviceImpl for PL011State {}
+
 impl PL011Registers {
     pub(self) fn read(&mut self, offset: RegisterOffset) -> (bool, u32) {
         use RegisterOffset::*;
@@ -746,3 +748,4 @@ impl ObjectImpl for PL011Luminary {
 
 impl DeviceImpl for PL011Luminary {}
 impl ResettablePhasesImpl for PL011Luminary {}
+impl SysBusDeviceImpl for PL011Luminary {}
diff --git a/rust/hw/timer/hpet/src/hpet.rs b/rust/hw/timer/hpet/src/hpet.rs
index 75ff5b3e8d6..b4ffccf815f 100644
--- a/rust/hw/timer/hpet/src/hpet.rs
+++ b/rust/hw/timer/hpet/src/hpet.rs
@@ -23,7 +23,7 @@
     qdev::{DeviceImpl, DeviceMethods, DeviceState, Property, ResetType, ResettablePhasesImpl},
     qom::{ObjectImpl, ObjectType, ParentField},
     qom_isa,
-    sysbus::SysBusDevice,
+    sysbus::{SysBusDevice, SysBusDeviceImpl},
     timer::{Timer, CLOCK_VIRTUAL},
 };
 
@@ -887,3 +887,5 @@ fn properties() -> &'static [Property] {
 impl ResettablePhasesImpl for HPETState {
     const HOLD: Option<fn(&Self, ResetType)> = Some(Self::reset_hold);
 }
+
+impl SysBusDeviceImpl for HPETState {}
diff --git a/rust/qemu-api/src/sysbus.rs b/rust/qemu-api/src/sysbus.rs
index fa36e12178f..fee2e3d478f 100644
--- a/rust/qemu-api/src/sysbus.rs
+++ b/rust/qemu-api/src/sysbus.rs
@@ -14,7 +14,7 @@
     irq::{IRQState, InterruptSource},
     memory::MemoryRegion,
     prelude::*,
-    qdev::{DeviceClass, DeviceState},
+    qdev::{DeviceClass, DeviceImpl, DeviceState},
     qom::{ClassInitImpl, Owned},
 };
 
@@ -25,10 +25,12 @@ unsafe impl ObjectType for SysBusDevice {
 }
 qom_isa!(SysBusDevice: DeviceState, Object);
 
-// TODO: add SysBusDeviceImpl
+// TODO: add virtual methods
+pub trait SysBusDeviceImpl: DeviceImpl + IsA<SysBusDevice> {}
+
 impl<T> ClassInitImpl<SysBusDeviceClass> for T
 where
-    T: ClassInitImpl<DeviceClass>,
+    T: SysBusDeviceImpl + ClassInitImpl<DeviceClass>,
 {
     fn class_init(sdc: &mut SysBusDeviceClass) {
         <T as ClassInitImpl<DeviceClass>>::class_init(&mut sdc.parent_class);
-- 
2.48.1


