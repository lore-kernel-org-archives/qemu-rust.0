Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E52D38FEF
	for <qemu-rust@archiver.kernel.org>; Wed, 14 Jan 2026 17:19:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vg4X1-0007De-V6; Wed, 14 Jan 2026 12:19:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vg4X0-0007DC-78
 for qemu-rust@nongnu.org; Wed, 14 Jan 2026 12:19:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vg4Wy-00055a-Pq
 for qemu-rust@nongnu.org; Wed, 14 Jan 2026 12:19:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768411179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G12U7HD1qt2fPICoBOKA56jEyJjkaqdG/Ug1Zr9+Wvc=;
 b=Aoo3PftBPAvcwLllfxjOlh4Km0vK007eHetyC16no3YbX6q8O935ax8u/Z4cj1tlpg96er
 es9xofWPEIghnjvZlWRW5JpvcycF8qaz0uGuPSvQDgdVRsEvntoKzAxfjttNIYBTwG+S1K
 0XcS9unr7BVOLNiL73eksSpKYHpkEd8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-EkCRnzkrPMK6xXhpZfpnwA-1; Wed, 14 Jan 2026 12:19:37 -0500
X-MC-Unique: EkCRnzkrPMK6xXhpZfpnwA-1
X-Mimecast-MFC-AGG-ID: EkCRnzkrPMK6xXhpZfpnwA_1768411176
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47d62cc05daso347255e9.3
 for <qemu-rust@nongnu.org>; Wed, 14 Jan 2026 09:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768411176; x=1769015976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G12U7HD1qt2fPICoBOKA56jEyJjkaqdG/Ug1Zr9+Wvc=;
 b=ZU1P9OWlOF9ODS9xwxTTsZ1LzFXVehtXgXQ1ba9yEVcuWS/lzoYioMYOnCroPyz9dI
 ztA4iGYEfRXesgvlsSBvIoTb4hQlLa+bEqV8KJdG4Pe2J7rFJ+OF0pv28ZFM10d7ZlzO
 KVizy69juzdXrrBRckHMEuPPSPXzWLhKkMY5dOCtO9dPmCeo9KM7Cox5vfTSDNHr2wd7
 Gz/RWkn5Q9GBjt6UOnqF60GDqy/oVbgCAJsg8clZCTifx6M0p+aaSTadd7HXvRq2eDU9
 zOy41ZRlZtvl0YZ4UpD6pihrX0b3UjwxYxvGlkMyjPUPPVJ2nHrRNOwq5mwSgjPbNTBy
 ie9Q==
X-Gm-Message-State: AOJu0Ywxg3qAfK6TBhfixj/VTMvych3U+iaCScTJY1Ewyz9vvX1ebZn8
 laeeZ1LGRuQr6nRBhnu0G0of+3GYY6OpUFwWVBGbZWgc2Em4x6BtZZsW2FXQsScG3RtUhIbJU96
 EpBGdAf3YLoiBaqyedsRW/MuH+NckmEnaWsO/Uj6xz5N3KCTgrk48qwz6eIUbEm0=
X-Gm-Gg: AY/fxX4PihJK1fc2TlJuLDOMAeT3YcNcZ1DA1dySlRtIqj4E4mJZ8/buCC3cMup1LZ4
 u8jKyCX/5hRsGMiPjfAswtPGluuODTFl3THFB6LFQ4ptQ/Pm1xnIx7V2VqvtgPZ0JLYBQJFdbDY
 DO7wKBbfAl3995c2/1GlAnk+ngoTUgOh/6N7xP/DVgkXdgEWBNwtTtL5Ln7MEjgj5QYM1LyaWx6
 r0Z6PROUQYbq71DZFT6iG7IahXinUVDV082ZsQfRWU2E/hzVsEq/Dsmszio8G0r7mkpWo6cVN5R
 MiKUBQKRNJHWPEJSt44iZPSyxQiTgRruleI4qY3oZlC8dAYuHnzZmOMpq7abBl1BukFUqJrBFEG
 3bl3hYbOvwoBNaLb1ZpOXjvhsESeYEw5hps2/6cZ5Zm0VisvPjzDitO8wjoFK5ydaQ2Q4Nhb0Qg
 8OviwdjET5yPUK6g==
X-Received: by 2002:a05:600c:458e:b0:47a:7fdd:2906 with SMTP id
 5b1f17b1804b1-47ee32fd0aemr33348645e9.12.1768411175809; 
 Wed, 14 Jan 2026 09:19:35 -0800 (PST)
X-Received: by 2002:a05:600c:458e:b0:47a:7fdd:2906 with SMTP id
 5b1f17b1804b1-47ee32fd0aemr33348415e9.12.1768411175354; 
 Wed, 14 Jan 2026 09:19:35 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428acd0csm2058085e9.6.2026.01.14.09.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 09:19:34 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH] qdev: add hw/core/gpio.c to libhwcore
Date: Wed, 14 Jan 2026 18:19:34 +0100
Message-ID: <20260114171934.1512674-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y1g9ZCXgd4AKc6_5mX2a8rAYh3xvIQvn6vfkFBay7tI_1768411176
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

While GPIO functionality is not used by user-mode emulation, it is
conceptually part of qdev - GPIO pins are included in DeviceState
independent of whether this is system or user-mode emulation.

For the Rust bindings, having GPIO functionality in system_ss causes
a problem because, for simplicity, all methods of DeviceState are
included in the Rust hwcore crate.  On Windows, rustc is not able
to do dead code elimination as well as on other OSes and this causes
an undefined symbol error, because gpio.c is not linked into the
rust/hw/core/rust-hwcore-rs-integration test binary.

To fix it, move gpio.c out of system_ss and into libhwcore.
Alternatively, it would be possible to define some DeviceState
methods also in the system crate, using for example a separate trace
SystemDeviceMethods.  For now, keep all the methods in one crate and
link 200 unused lines of code into user-mode emulators.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/meson.build b/hw/core/meson.build
index b5a545a0edd..8a96567de8f 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -1,6 +1,7 @@
 # core qdev-related obj files, also used by *-user and unit tests
 hwcore_ss.add(files(
   'bus.c',
+  'gpio.c',
   'qdev-properties.c',
   'qdev.c',
   'resetcontainer.c',
@@ -29,7 +30,6 @@ system_ss.add(when: 'CONFIG_EIF', if_true: [files('eif.c'), zlib, libcbor, gnutl
 system_ss.add(files(
   'cpu-system.c',
   'fw-path-provider.c',
-  'gpio.c',
   'hotplug.c',
   'loader.c',
   'machine-hmp-cmds.c',
-- 
2.52.0


