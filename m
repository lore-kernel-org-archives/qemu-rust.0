Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tN297-0007NS-Rj
	for mharc-qemu-rust@gnu.org; Sun, 15 Dec 2024 22:51:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tN294-0007MK-Ms
 for qemu-rust@nongnu.org; Sun, 15 Dec 2024 22:51:46 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tN293-00060s-1o
 for qemu-rust@nongnu.org; Sun, 15 Dec 2024 22:51:46 -0500
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3eb8db8ae9aso1687632b6e.1
 for <qemu-rust@nongnu.org>; Sun, 15 Dec 2024 19:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734321103; x=1734925903; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LQ8DmbEliR36Gw9tzToNMCsxXQSyqG0+BCSp50GnSP8=;
 b=hIWlae6xZoB2uA8InVyLjMKmQJfXzQhny6urf95sneeUQP1Pa6BmS5Bc49kyrSAwy8
 xrxW1le3NDYE1S0kh6Md3i7PMt75MmFy64Dc32TgTMsDZkuLyQD5u8e3WQGfG/0Xr1Lf
 nAe2UMeAC0VebwdizhmSPZwF8N+ELobvUr/PWFjEoQYcbIV0GYjpjvEDa0QZDug+uSzb
 kzOA4+PM7tnQwTWvgDeTvFrI6XnM+2SdMuwjmEiFCW26LkAr/nCa3N6pIVSy4AzZuPK5
 iHJ+woL+Z0SI/8RYmZElc6OeHsPqUmQCerDxCDhDf8LB1OJU10xMNnOe7CvlXzJBuJeA
 aCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734321103; x=1734925903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LQ8DmbEliR36Gw9tzToNMCsxXQSyqG0+BCSp50GnSP8=;
 b=tkAGTEsRgyVGdHTBlm2Qp8dtqsZmNJRa+NCa7zH6XW3KYWuomwpM8SGey494L7dEeh
 +9j5HSKj3K5a5AdOFyR3ZLC8fgh7kimmNeHTAX8pcoEUh4oWhL8kVzmEathNIjXy8Jxl
 LTu1FAC9hvxfG9HBYBjq/hDxbTLAEb5Eo8kcidsNLdxCF2iCpdmP7bzNsO6mGocuaebE
 CB3Q40RsAOkFKmKbojJ8i9F80oFyRylnQcTzGqG47Ad54jFwPJSbUq3hqMMx2PN3wW3r
 YJSU2lr/UzysYRBZboUXIRvTitBKYesUHweZlR0TCVF4/JXChG6PCIvXTvYQLGnfKdaq
 0oOA==
X-Gm-Message-State: AOJu0YwEn0bL+tGsnv05pG5b/G+rETFOzUT5879PCDH37ep6Ih4ntK7u
 Ug6RLa2qyWLKAr0oSHkhdxpEHiezObET4Yl7ghdsUelUE5TadmewVjNgvP9yCeWaefUtciK9cm/
 oCYiJJDju
X-Gm-Gg: ASbGncsdNqaDAtYGNLQbd4gZJ2a+VV3zxcduzr3yO6TL5elB3HpagswUeZLI2+7mf6u
 XjSU0sPymbJjANABPAsglVnt0Aj1xicahBz1sLK27Ph8ce6NuDS3UjAvZ+rku3zU3OkkiHxsRNA
 8xIkO+EYsDqAAMeKrAYtX/0AHVTEZhxsB0ALWQ/Zk6aNf4hvTUlbCMFHgnQMTTFalJpJHDAYnf2
 vllLov1bIiK3SwcQiXhojxBD/KCNjrQWn5NMrujppLxZ6UIF/i06tYw6rhLHVewG0o9w4U89vxA
 M6D4A2an0q3kBbgtssIx73WVJ5LSH2GdBARv3Sw27ck=
X-Google-Smtp-Source: AGHT+IHOtWQ7btirqjH1OislPe5s72vDzrqnrAM6Pe7Fyp67u/vGiNyvYw4bE90FQvyey6z8L0FPfQ==
X-Received: by 2002:a05:6808:4488:b0:3eb:7399:29d3 with SMTP id
 5614622812f47-3eba6955c77mr6097287b6e.43.1734321103632; 
 Sun, 15 Dec 2024 19:51:43 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f33a93a6d1sm1287493eaf.33.2024.12.15.19.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 19:51:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 17/24] rust/qemu-api: Use device_class_set_props_n
Date: Sun, 15 Dec 2024 21:51:02 -0600
Message-ID: <20241216035109.3486070-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216035109.3486070-1-richard.henderson@linaro.org>
References: <20241216035109.3486070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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
X-List-Received-Date: Mon, 16 Dec 2024 03:51:46 -0000

This means we can update declare_properties to drop the
zero terminator at the end of the array as well.

Cc: qemu-rust@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 rust/qemu-api/src/device_class.rs | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/rust/qemu-api/src/device_class.rs b/rust/qemu-api/src/device_class.rs
index 03d03feee8..cca51fe1a9 100644
--- a/rust/qemu-api/src/device_class.rs
+++ b/rust/qemu-api/src/device_class.rs
@@ -7,7 +7,6 @@
 use crate::{
     bindings::{self, DeviceClass, DeviceState, Error, ObjectClass, Property, VMStateDescription},
     prelude::*,
-    zeroable::Zeroable,
 };
 
 /// Trait providing the contents of [`DeviceClass`].
@@ -31,7 +30,7 @@ pub trait DeviceImpl {
     /// device.  Not a `const` because referencing statics in constants
     /// is unstable until Rust 1.83.0.
     fn properties() -> &'static [Property] {
-        &[Zeroable::ZERO; 1]
+        &[]
     }
 
     /// A `VMStateDescription` providing the migration format for the device
@@ -87,7 +86,10 @@ fn vmsd() -> Option<&'static VMStateDescription> {
         if let Some(vmsd) = <T as DeviceImpl>::vmsd() {
             dc.vmsd = vmsd;
         }
-        bindings::device_class_set_props(dc, <T as DeviceImpl>::properties().as_ptr());
+        let prop = <T as DeviceImpl>::properties();
+        if prop.len() != 0 {
+            bindings::device_class_set_props_n(dc, prop.as_ptr(), prop.len());
+        }
     }
 }
 
@@ -134,7 +136,7 @@ macro_rules! define_property {
 macro_rules! declare_properties {
     ($ident:ident, $($prop:expr),*$(,)*) => {
         pub static $ident: [$crate::bindings::Property; {
-            let mut len = 1;
+            let mut len = 0;
             $({
                 _ = stringify!($prop);
                 len += 1;
@@ -142,7 +144,6 @@ macro_rules! declare_properties {
             len
         }] = [
             $($prop),*,
-            $crate::zeroable::Zeroable::ZERO,
         ];
     };
 }
-- 
2.43.0


