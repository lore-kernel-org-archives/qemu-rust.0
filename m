Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uN7eN-00089u-Ht
	for mharc-qemu-rust@gnu.org; Thu, 05 Jun 2025 06:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7e0-0007TE-Gb
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uN7dy-0001Lf-Ec
 for qemu-rust@nongnu.org; Thu, 05 Jun 2025 06:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749118577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTevlSH5ZQkYyW+Mm1Gr4K/vGmq39vmXxviFGBBggFI=;
 b=XJJv0+21BIcGp1uT9FKvVyC1XOfLFhriL83Jwjy8N0rv//2bO5Ntm6l4JyupGDX2NqWkw3
 Ja1HubdkMl7PQTgbpdXiIygqMoPbVpDqX8ZPgCj73yx7vbXOZIkZ3Bm1We/nRprNdp2A4n
 7bU9kKi4lQuuULEdV712vsupEZ3AdMA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-sFbb_V44N769Bxx1qGoYPQ-1; Thu, 05 Jun 2025 06:16:17 -0400
X-MC-Unique: sFbb_V44N769Bxx1qGoYPQ-1
X-Mimecast-MFC-AGG-ID: sFbb_V44N769Bxx1qGoYPQ_1749118574
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a503f28b09so402164f8f.0
 for <qemu-rust@nongnu.org>; Thu, 05 Jun 2025 03:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749118574; x=1749723374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VTevlSH5ZQkYyW+Mm1Gr4K/vGmq39vmXxviFGBBggFI=;
 b=WZxSs1l67Nvvi9DgqyLbbo7oYXS/ZIClJAsLbMU9vjpw6+U0R7w6FWSLBOvBIz1KrY
 Hj86nSouCeJ00bTYmSUpiAzvUH04agcYwTcLs+nm1I1FojcrxY9QZNL4m45K4J9u9UEc
 9+pEOCEUbKjGi2PbaosxYuR6WaRQ/2lTUctMs6KjL66hp17nTCqfHE5OMAJL/8wS76X/
 hXpQOgrQv6G/9SMeNYGBDRAFxm1O0PH5WPV7GP9k1Dp9vMsQHVDdmdRl+pyhgJ7J6zf3
 ZpzcJHAOUx5RSPXSpukKSvqsszKifPmY+jgWuYh3sMUG10aQ3ooUXbW90Eg+HZ0Kvvr1
 N5eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtIYcewemC3Bp1OsJtkAmyZsXXToNiYrtd9172UR5T5dqYPHvAAQ0puNsEwMKrcWPLMMMeMlfrgp0=@nongnu.org
X-Gm-Message-State: AOJu0YzuKxwKt7Zp1oJBLMObThhvcJyLcnpuPre3kHoOLoKm4QmWvQDq
 T8/ra9tmFvpinTeRjpU7U2eASPMJO753aiCl7/qp31trrJiAd2V/ET2kXGnXSKPZotu5qgiC81c
 L1dVStUecQ/eSxUWdutBchfZLtqxx1eYKeNJkpDO9dE4pgA7Z7drFZkg=
X-Gm-Gg: ASbGncsauXw9qHTz0ufezm9cVE5mlu9Mq3gjaADItKtJ7BFdfiwWzE6/zfEndp+f2IQ
 3TUpgGvdE4jgBU0NkotGQv817WWHvapgHyN8eqj7ewe44a8Vyg7b9GN+PsinV/bBcXWfhhCD/H1
 cArxlHmSOt7ik0km7nliiSGtuljrCFqqv1kF5WpleKiRiusnOzpU8+Oa3t7qMuYPyZmca5QxNAq
 QMpeRA7jvoOnS8aX9lYROpciw7/O+w3+ZnPxW1D7p+GqIzmWuJSICDvKAxxFatxSQf1D9oAAD6m
 1cTTc4G/lgcIrw==
X-Received: by 2002:adf:a29e:0:b0:3a5:271e:c684 with SMTP id
 ffacd0b85a97d-3a5271ec74dmr1773810f8f.24.1749118574214; 
 Thu, 05 Jun 2025 03:16:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOh3cD0KZpsvpGZ/pQsCY6Fp/N6aQKKYgtvbN/uCdquTaBlIjQGa0RQBH0Zpn6p42Bc82C5w==
X-Received: by 2002:adf:a29e:0:b0:3a5:271e:c684 with SMTP id
 ffacd0b85a97d-3a5271ec74dmr1773799f8f.24.1749118573862; 
 Thu, 05 Jun 2025 03:16:13 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451f828715esm17540095e9.0.2025.06.05.03.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 03:16:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	zhao1.liu@intel.com,
	qemu-rust@nongnu.org
Subject: [PATCH 11/14] hpet: return errors from realize if properties are
 incorrect
Date: Thu,  5 Jun 2025 12:15:40 +0200
Message-ID: <20250605101544.368953-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605101544.368953-1-pbonzini@redhat.com>
References: <20250605101544.368953-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Uq5tzfeF-WXlxbMZwRRjwC7l1RQM8YcQpksD5YZcRH4_1749118574
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
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
X-List-Received-Date: Thu, 05 Jun 2025 10:16:21 -0000

Do not silently adjust num_timers, and fail if intcap is 0.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/timer/hpet.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 9db027cf76f..cb48cc151f1 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -691,8 +691,14 @@ static void hpet_realize(DeviceState *dev, Error **errp)
     int i;
     HPETTimer *timer;
 
+    if (s->num_timers < HPET_MIN_TIMERS || s->num_timers > HPET_MAX_TIMERS) {
+        error_setg(errp, "hpet.num_timers must be between %d and %d",
+                   HPET_MIN_TIMERS, HPET_MAX_TIMERS);
+        return;
+    }
     if (!s->intcap) {
-        warn_report("Hpet's intcap not initialized");
+        error_setg(errp, "hpet.hpet-intcap not initialized");
+        return;
     }
     if (hpet_fw_cfg.count == UINT8_MAX) {
         /* first instance */
@@ -700,7 +706,7 @@ static void hpet_realize(DeviceState *dev, Error **errp)
     }
 
     if (hpet_fw_cfg.count == 8) {
-        error_setg(errp, "Only 8 instances of HPET is allowed");
+        error_setg(errp, "Only 8 instances of HPET are allowed");
         return;
     }
 
@@ -710,11 +716,6 @@ static void hpet_realize(DeviceState *dev, Error **errp)
         sysbus_init_irq(sbd, &s->irqs[i]);
     }
 
-    if (s->num_timers < HPET_MIN_TIMERS) {
-        s->num_timers = HPET_MIN_TIMERS;
-    } else if (s->num_timers > HPET_MAX_TIMERS) {
-        s->num_timers = HPET_MAX_TIMERS;
-    }
     for (i = 0; i < HPET_MAX_TIMERS; i++) {
         timer = &s->timer[i];
         timer->qemu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, hpet_timer, timer);
-- 
2.49.0


