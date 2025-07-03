Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uXKSq-0000wH-4o
	for mharc-qemu-rust@gnu.org; Thu, 03 Jul 2025 09:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uXKSo-0000vc-DS
 for qemu-rust@nongnu.org; Thu, 03 Jul 2025 09:58:58 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uXKSh-0000jA-Du
 for qemu-rust@nongnu.org; Thu, 03 Jul 2025 09:58:58 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ad56cbc7b07so981147266b.0
 for <qemu-rust@nongnu.org>; Thu, 03 Jul 2025 06:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751551128; x=1752155928; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jF8aqDbU3LXGxNB2udC3gwDcAxLsQwt6wTonGUyu9pA=;
 b=FoVlHEqjHbU6TgJvk0Rmd8JilWw6UI51DO7SOkuVGIrMW/4eRzJDHdrKDbM+zUawhh
 WjKyesPCWOAdf/zeFhsTgSS0cgPqqaRfTklDICnaOe/0QJfZjAkDviKYvBCjUpZ2QPp5
 IPS7ipo9AXKndyAbaXQd3Pq9hMZvXI/MV4sBji+mXSlWY2JTIZNT/7+qYMO61q6/lnPX
 hFeXFoGT1tV9LzWEmLP6y/7XjhiH+NqSdGUBN0c2TY+mW24Sv66OKKq2pYwivONU+PIK
 j+YRtog73a3k6lpmA8UiNkddChC8AvOvVqfUf3nhe7s5FeYH2em54KG0hK4rJqwBe6An
 y8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751551128; x=1752155928;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jF8aqDbU3LXGxNB2udC3gwDcAxLsQwt6wTonGUyu9pA=;
 b=vn7YRWiNzonbd0w+j3IoTqdCAqk0kE2Bv7zlVDZ57frpM2EMahjLzE/3bDuysUfA76
 nA80xgl+PPynkL3sOvo+TziPcnU33ga3awY2F3JEuQaNUVLMuNtPL41v9qhbZPW148+V
 +ZVXW3zDX4C552+1nWUHdSPXC138nf3RdX8P6N2wKH+BOqOz+YsS7n/5CEsbrYtp4CMF
 JfwsWa2zhfSSZsI9XLt/cdmDnbbWg0q+B7ji8M9a1NdInRZ4qy+hVAGA9W4utORQJmWn
 qbzmu4A5dYUApe1Nvqr/vAvWVkmguPjUESdIvjoAqMmqXl1Fl4w77odYVLy957RKWbwb
 ipmg==
X-Gm-Message-State: AOJu0YyLy2WIOouSDo2rSo0x/oaGVRRxFXxj1zT+8Xyr6egVtGQfWKxP
 2jmWXFWI08q2JrHvnnAF80Cz2On8h8PMEGb1rAQRdmque/Lf7FngrHgJ5w/wdSa5iiY=
X-Gm-Gg: ASbGnct/7D9D4/H22N9XEFfL/b53Y06M3Fzd7XnuE1U2E3ARrc0NDWaX3R+rNybMjuy
 J9+d/9D4Ejg0ajP7atubecY6WKu3YkUwj3bgsr+1h0/ztpilOG1F/vQfuDiROrdDQ5ZGCuts8Tb
 /drRJBZm6VtIsJ413M1WzZ87/vU/WG0xPQRlMREn2+39vja8URowkypCETpZH+aaUJVvzH6ZlUk
 /WcEIz6Aq3oLV2SMc4mRZsugU3Grnk/JTYRYMGb9q2TC4ePNCZpsk0cAeIoaAg+iFNVa1IHXVWn
 wvpuwu013yS++kZrcGAmGWPAXgT5obFxpoLBYISVqX2q1a09ty+Fo8/OUka9czEL3IOOrc5BHVb
 VsIn/Ql94g2nmpHgbb9hT8g/QLT+e/nQ=
X-Google-Smtp-Source: AGHT+IG3N/M9icLX7qjM1o7pOePX0VOawUQ0FpVJu5KZpLU7NYRtk5P60awXFNpV+ee3EQ6YVob1MQ==
X-Received: by 2002:a17:907:7292:b0:ad2:43b6:dd75 with SMTP id
 a640c23a62f3a-ae3c2b3c08dmr734217066b.10.1751551128203; 
 Thu, 03 Jul 2025 06:58:48 -0700 (PDT)
Received: from [127.0.1.1] (ppp-2-86-212-125.home.otenet.gr. [2.86.212.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353ca1ca6sm1279678966b.176.2025.07.03.06.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 06:58:47 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 03 Jul 2025 16:58:13 +0300
Subject: [PATCH 3/3] rust: add *_with_attrs methods to MemoryRegionOps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-rust-mem-api-v1-3-cd5314bdf580@linaro.org>
References: <20250703-rust-mem-api-v1-0-cd5314bdf580@linaro.org>
In-Reply-To: <20250703-rust-mem-api-v1-0-cd5314bdf580@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3630;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=1P+RBgerOZPwGjZrNaYJyYxeZQDGYekhtRtwSuEW7oM=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9ab3lUWXlGTk9xWUZNakU2Ky9qYU02YmNTU3VUCldBczhvbGVZeWxiRHFnQ3pQ
 Y0NKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUdhTWt3QUt
 DUkIzS2Nkd2YzNEowSytlRC80MXFlbG10cE9NcjdNcmZ0alFCT3R6enFaeEt6L2FKdDBSOXNlVA
 pEeURWejRmSXUwUnI0K2JGcE5oc2RMWUxPWC9GVzRZMFpOVXZoTXFLc0J4RTNpRVFGWEJtNXRkR
 ERFVjlPeWE1CmtudWZKdEJRTVI0dDhDcEI2clFsOGw2UStHbmFnRTlNUzY4cUJtblhwbTA4L1ha
 SGhGVjErMCtVM1NpNU9rckkKMUx0ZDhmeVZ0d01LK3BxSlIrdDRoczRtVkpIUmZPaGdFSnl3MWp
 RZ0EwdWFqTVRMYWxBTU9xM2Q2QVo4MGtOMgp1SjI2VWYvSGpqNE8wVktnMllHL25Pb3YxTzFETW
 N5SUF0NkxsQm9waDBSSmxqK0toOHZ4d2xzZnh2cERJcXdLCjdxaHJmcERxQWJEek5rekhDcXFJR
 ThyYUtDM3pKRDZSbTEzY2RGTFdnOFhLaVZsWDl5WCtFc01pRy9Dbjh3bzEKMWhwSnRMZkhVSTA4
 STZ5amRRcjVkSjlmWTZmZCtGL2dKbDdSOG1DbU5xUmJqdFUwdUJnK0wzbnhEcVBYZEgvWgpaMjI
 2ZTRIYWFHdEtDTXUxRVc1a1dENGlxWHU3TUh6YzJsUVBkdlNGTmR4Qjhnc2duRlE3bU8xSkhjNX
 Q5Y0drCi93dzJKaVJ1bDFuYkp4a1UwNGZYV0pxY0N0a25xbG1JeDNxWUFENXdDdGsxd3Jtby80S
 mhibG9DU2F1alhLN3QKM0ExaUdIblg4ekZadEthZVZKWXRURDhwd2FqdTNtYzR1MlZFSHhNQXNo
 UGR2VFFWejdlcnhOZEU0NWhXNTU3NApyV2FOS0JGTTZXTmJqdlFnL2Ixa1pDcXhZYWZvVTF2eFZ
 lbXZRMjdYTUZPcWplWWFHYzQ0VnVwOXFsTUZVYm5ICjhGaHA1UT09Cj1XNit0Ci0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 03 Jul 2025 13:58:58 -0000

MemoryRegionOps (and its builder type) only support read/write
callbacks.

Add the ability to define {read,write}_with_attrs callbacks for devices
that need them.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 rust/qemu-api/meson.build   |  1 +
 rust/qemu-api/src/memory.rs | 52 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index a090297c458b1a282211b9e241c0e447dd594167..95c097ec8f8dd31a863339d58eaa8bfc4d4dea18 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -26,6 +26,7 @@ foreach enum : c_enums
 endforeach
 c_bitfields = [
   'ClockEvent',
+  'MemTxResult',
   'VMStateFlags',
 ]
 foreach enum : c_bitfields
diff --git a/rust/qemu-api/src/memory.rs b/rust/qemu-api/src/memory.rs
index b1907aa01300a3fac8e1f3b69c5d50da631a556d..98d1e116147aba2c9034a61159492382b1ee0e5e 100644
--- a/rust/qemu-api/src/memory.rs
+++ b/rust/qemu-api/src/memory.rs
@@ -9,7 +9,7 @@
     marker::PhantomData,
 };
 
-pub use bindings::{hwaddr, MemTxAttrs};
+pub use bindings::{hwaddr, MemTxAttrs, MemTxResult};
 
 use crate::{
     bindings::{self, device_endian, memory_region_init_io},
@@ -59,6 +59,20 @@ unsafe impl<T: Sync> Sync for MemoryRegionOps<T> {}
     F::call((unsafe { &*(opaque.cast::<T>()) }, addr, size))
 }
 
+unsafe extern "C" fn memory_region_ops_read_with_attrs_cb<
+    T,
+    F: for<'a> FnCall<(&'a T, hwaddr, *mut u64, Bits, MemTxAttrs), MemTxResult>,
+>(
+    opaque: *mut c_void,
+    addr: hwaddr,
+    data: *mut u64,
+    size: c_uint,
+    attrs: MemTxAttrs,
+) -> MemTxResult {
+    let size = Bits::try_from(size).expect("invalid size argument");
+    F::call((unsafe { &*(opaque.cast::<T>()) }, addr, data, size, attrs))
+}
+
 unsafe extern "C" fn memory_region_ops_write_cb<
     T,
     F: for<'a> FnCall<(&'a T, hwaddr, u64, Bits)>,
@@ -72,6 +86,20 @@ unsafe impl<T: Sync> Sync for MemoryRegionOps<T> {}
     F::call((unsafe { &*(opaque.cast::<T>()) }, addr, data, size))
 }
 
+unsafe extern "C" fn memory_region_ops_write_with_attrs_cb<
+    T,
+    F: for<'a> FnCall<(&'a T, hwaddr, u64, Bits, MemTxAttrs), MemTxResult>,
+>(
+    opaque: *mut c_void,
+    addr: hwaddr,
+    data: u64,
+    size: c_uint,
+    attrs: MemTxAttrs,
+) -> MemTxResult {
+    let size = Bits::try_from(size).expect("invalid size argument");
+    F::call((unsafe { &*(opaque.cast::<T>()) }, addr, data, size, attrs))
+}
+
 impl<T> MemoryRegionOpsBuilder<T> {
     #[must_use]
     pub const fn read<F: for<'a> FnCall<(&'a T, hwaddr, Bits), u64>>(mut self, _f: &F) -> Self {
@@ -86,6 +114,28 @@ pub const fn write<F: for<'a> FnCall<(&'a T, hwaddr, u64, Bits)>>(mut self, _f:
     }
 
     #[must_use]
+    pub const fn read_with_attrs<
+        F: for<'a> FnCall<(&'a T, hwaddr, *mut u64, Bits, MemTxAttrs), MemTxResult>,
+    >(
+        mut self,
+        _f: &F,
+    ) -> Self {
+        self.0.read_with_attrs = Some(memory_region_ops_read_with_attrs_cb::<T, F>);
+        self
+    }
+
+    #[must_use]
+    pub const fn write_with_attrs<
+        F: for<'a> FnCall<(&'a T, hwaddr, u64, Bits, MemTxAttrs), MemTxResult>,
+    >(
+        mut self,
+        _f: &F,
+    ) -> Self {
+        self.0.write_with_attrs = Some(memory_region_ops_write_with_attrs_cb::<T, F>);
+        self
+    }
+
+    #[must_use]
     pub const fn big_endian(mut self) -> Self {
         self.0.endianness = device_endian::DEVICE_BIG_ENDIAN;
         self

-- 
2.47.2


