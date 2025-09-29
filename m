Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5991FCAC5B9
	for <qemu-rust@archiver.kernel.org>; Mon, 29 Sep 2025 15:56:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3G9d-0001Mw-HM; Mon, 29 Sep 2025 11:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G8z-0000yd-RK
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G8j-0000a6-I9
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759161009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1UYvpWRO/JEP1N+v0NfQMK0anDtilvG7xZppl/bh2cs=;
 b=C/9bcLNnsm8kxN/pgGl9catIy6uG9sbFreOOSOwYDpozDk2KjlguuxmxNeat26fQl7CedI
 CgqJ74Uyu3Y/YC2SjDkpsHmlazy4wwDG8StpW/Oy2Fs+9C8G7C7+cZqNDSigfv51mVgBnY
 KmHrWpt8kPqIAxmkgiECaDycZnMiVW8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-7k96MT7hM9KxAhzve8xi8Q-1; Mon, 29 Sep 2025 11:50:08 -0400
X-MC-Unique: 7k96MT7hM9KxAhzve8xi8Q-1
X-Mimecast-MFC-AGG-ID: 7k96MT7hM9KxAhzve8xi8Q_1759161007
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-62fcb646334so7723397a12.2
 for <qemu-rust@nongnu.org>; Mon, 29 Sep 2025 08:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759161007; x=1759765807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1UYvpWRO/JEP1N+v0NfQMK0anDtilvG7xZppl/bh2cs=;
 b=NC346HyhxnEEpd/QBZy2C+jW/wee9h6PvYEa0lAIxgsNLjYrYLiMuTE1y2PFkEtu+C
 wlm1zTQXeNPxf5+MxICa2DMXy+XHqix0zXE9pLYCYYS6H82rZcmxNxD1FxtlNL6vRoAR
 MW3tLa1jcLHOscSzbbalLTzd2H1XKyjv+1BfnkCnIBuo1iKNYf5FwJs9Xz5js46e2A1D
 a5yAU/406/n7dkub5Q6J15GCdd0s+FRHB0iOwU+SbhoMtHI7l5PvYQrklyfEF0LiNeEV
 ttfrT73g1zdpa2ZHXcDpqv25VpWxIKHsTzfDw9JilNRNL2vPspN+GChEpOk0JeFETLVM
 FnFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwnsk1yhGi0z+z9r2XUQVOOGkptGVJjBmLLqvVKZWrOWyAQqA9864J8KEGe2pHuY+woboZbOFLtx8=@nongnu.org
X-Gm-Message-State: AOJu0YxgK4vZo+Yfe7fqQxy1urNif2m1hfr+QgoLincVxdrGUWPrBqBG
 mzGlRR87IjAF7XLhi5QvBzQjuqTcfAZp2Qt5JcOiDg8VcCD0yZ84OL3vGVa1qRWtI960KyUATEL
 tSyEa+QCIqbqAyOOlhbJ8ysDpQRzIFNk3hdvLMGdvm9GG0WgjNppvXFk=
X-Gm-Gg: ASbGncsH5UsGL+/m8TpxqtiR3PsydQa+Thr1XJmA8ibNTpyEzoWDP01j/0A+UdF+7Tu
 GLjy3Po1T+5W1T1cPuJtfmD6q8Oi1A6MuOMa9xQJKN+zv1MUu0GLD19U9SE0fswCkTvZzMhYDlW
 H3hAU/pcYNkWdMBfOeKxXitzkJ/s17qSKMV7z9LbES7BapgQx6xCBsrTYl1Jf29HmaXAeHHi9Hf
 3u86VdekRJHq59KvKuX0w0qBdSOsrtx8VeLVObvsZzv4OfS2693o4BnBM5rd2EX0LjVkSwMuMr4
 H2AYWp7YBlsuX1U3tXqx7Pk43cp0P6Q4S+NklMvRlfl/SaCPay5UPZ4QYW44/MCTi1YceE9dG4/
 Y5JTj9WUlVjGPgeatgiYl+Cy7Q5OSgHGE/4NVptl5UiZYbg==
X-Received: by 2002:a17:907:86a6:b0:b30:c059:f663 with SMTP id
 a640c23a62f3a-b34bc970e65mr1744249166b.64.1759161007185; 
 Mon, 29 Sep 2025 08:50:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIxmGgeQXdAZ75QQmrZZW4Hc3n5hES5tQ4jVsFmLv3QAstwb41N3BbgxYOJl9x+OFhq12wRQ==
X-Received: by 2002:a17:907:86a6:b0:b30:c059:f663 with SMTP id
 a640c23a62f3a-b34bc970e65mr1744245266b.64.1759161006602; 
 Mon, 29 Sep 2025 08:50:06 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3d277598bdsm332933166b.3.2025.09.29.08.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 08:50:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tanish Desai <tanishdesai37@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-rust@nongnu.org
Subject: [PATCH 10/16] rust: qdev: add minimal clock bindings
Date: Mon, 29 Sep 2025 17:49:32 +0200
Message-ID: <20250929154938.594389-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929154938.594389-1-pbonzini@redhat.com>
References: <20250929154938.594389-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Yq4ukkNgFLvdonK0gfxcicOP-ryIExoDcWoAGa8ltHc_1759161007
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Add the minimal support that is needed by pl011's event and tracepoint.

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/core/src/qdev.rs | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/rust/hw/core/src/qdev.rs b/rust/hw/core/src/qdev.rs
index a4493dbf011..c3097a284d7 100644
--- a/rust/hw/core/src/qdev.rs
+++ b/rust/hw/core/src/qdev.rs
@@ -411,6 +411,39 @@ fn init_gpio_out(&self, pins: &[InterruptSource]) {
 
 impl<R: ObjectDeref> DeviceMethods for R where R::Target: IsA<DeviceState> {}
 
+impl Clock {
+    pub const PERIOD_1SEC: u64 = bindings::CLOCK_PERIOD_1SEC;
+
+    pub const fn period_from_ns(ns: u64) -> u64 {
+        ns * Self::PERIOD_1SEC / 1_000_000_000
+    }
+
+    pub const fn period_from_hz(hz: u64) -> u64 {
+        if hz == 0 {
+            0
+        } else {
+            Self::PERIOD_1SEC / hz
+        }
+    }
+
+    pub const fn period_to_hz(period: u64) -> u64 {
+        if period == 0 {
+            0
+        } else {
+            Self::PERIOD_1SEC / period
+        }
+    }
+
+    pub const fn period(&self) -> u64 {
+        // SAFETY: Clock is returned by init_clock_in with zero value for period
+        unsafe { &*self.0.as_ptr() }.period
+    }
+
+    pub const fn hz(&self) -> u64 {
+        Self::period_to_hz(self.period())
+    }
+}
+
 unsafe impl ObjectType for Clock {
     type Class = ObjectClass;
     const TYPE_NAME: &'static CStr =
-- 
2.51.0


