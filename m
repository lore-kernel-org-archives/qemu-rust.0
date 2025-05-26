Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJYly-0003PM-Qp
	for mharc-qemu-rust@gnu.org; Mon, 26 May 2025 10:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlf-00032B-Us
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlZ-0007sV-VE
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748269522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QvZyFdDkuLWp6FY5Epn837HgIKSyXbzfGWIif8TNWJE=;
 b=NB0PI2joxlGAH/jDE6Q4IkCd//paj0bGACRAUY8lJKINjreJS+/OIHYpUhXPzlRd5KwTHc
 TeYX9E5aQgnS5nYythIQ3jp1wpvswU6CsrpKsW/eh/gN0pSs1zJRc24ogAordUe87heJXX
 fwVX/p9INSYL5Hfq42eAGnOXh1Y/mIA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-2QKPz9NTNQOF8Y8RPedm4A-1; Mon, 26 May 2025 10:25:20 -0400
X-MC-Unique: 2QKPz9NTNQOF8Y8RPedm4A-1
X-Mimecast-MFC-AGG-ID: 2QKPz9NTNQOF8Y8RPedm4A_1748269519
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4d863ac97so463255f8f.2
 for <qemu-rust@nongnu.org>; Mon, 26 May 2025 07:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748269519; x=1748874319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QvZyFdDkuLWp6FY5Epn837HgIKSyXbzfGWIif8TNWJE=;
 b=b8capRXhTApJlvaPD8qVtZdAhV+rnIRpvFS6llS2Fozumk5rtQIQ7gpsC556l2mpkq
 Lna8tk/+1fuJXl4RZoFRIIniT9XWZJkHNyLm3GhodlrWegr1SgHewVhDY7ZX0HpatQdN
 kXqyzyVKf9ianjlgKgAHpm5r/qEV36ggoyaEit94Z9o3VUc/ynVCgP6D7bf5imj5itt0
 CUgGUnAzVKgcgoL/2tPCnjIeGBVQJA9cyanU0OYWDyv1Dd4q+cx7GwxWUzk/9hTVQjA9
 +nqtonPUVfH97jP3xOmTVFMZINueeVD11mg13329b616cmzAg2RGw1vW0bG5pz6I9I6n
 wvjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCiUVGk9ZI8ti3aZtRO112cQlG+m2PX5buE5jOSf2nKhRCehcYjRs/B+J7m4qXepASO6eeCJI8UAA=@nongnu.org
X-Gm-Message-State: AOJu0YxLkfax7F/y/lojDM/RPwboHVIZzraSwCtk5fS0vbkkb3/d/eKO
 /OR9vrasOo7QKjCIy1LyvFI9oiY0CKOh5swBI0YcdeN1u/TZdnE1VDFvSRFCleZx0fO0SrIIOn4
 XKvxk5R2gsaXX71PLr8eNBEZmB4kF26KjdPheaSfOioy8h8DtUcEpxqg=
X-Gm-Gg: ASbGncshGF+24hRempQmXGYx9gS42gp1rON5V4TcSfoVXGmfn+Q24EIkQfOcIziyu8J
 532Gx49rGeEf0fNh8BMPdVXBXomO2Q7cDAxWJ+qBw9VFfdcOM9l4i5Py/GJ8mi7mSBNLJjcc9bQ
 B1euxWejBlWJQkgmFdwxybom+5JLFLGDWUzYBymeNZBcmDjTKEohhx/wDteO8m9o7E4MpncMAaQ
 7vfSXyN3KTxiYXfcKOrB6fymuEhtzgRMvqBkq0tbMFsNovmXz8Hz2+g/YdZzOcK97i50XaAI6jQ
 2JBJp08A1fcnpw==
X-Received: by 2002:a5d:4b0a:0:b0:3a4:d0c7:3129 with SMTP id
 ffacd0b85a97d-3a4d0c73965mr5407724f8f.14.1748269519317; 
 Mon, 26 May 2025 07:25:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDeFahvOPqy2waJ/Pycb38J675xYr5da0aKZ9K1bKkU48AJTjv4Abz7rBZUhS7IgDqU9MYrg==
X-Received: by 2002:a5d:4b0a:0:b0:3a4:d0c7:3129 with SMTP id
 ffacd0b85a97d-3a4d0c73965mr5407699f8f.14.1748269518921; 
 Mon, 26 May 2025 07:25:18 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442ebd6fe86sm321161945e9.0.2025.05.26.07.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 07:25:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 10/12] hpet: return errors from realize if properties are
 incorrect
Date: Mon, 26 May 2025 16:24:53 +0200
Message-ID: <20250526142455.1061519-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526142254.1061009-1-pbonzini@redhat.com>
References: <20250526142254.1061009-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XZsMVO_AWnnXz_k0QlsxJ8rGondHEUyeRkaUptotYLc_1748269519
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.903,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 26 May 2025 14:25:36 -0000

Do not silently adjust num_timers, and fail if intcap is 0.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/timer/hpet.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index d1b7bc52b7b..d78aba04bcd 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -689,8 +689,14 @@ static void hpet_realize(DeviceState *dev, Error **errp)
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
@@ -698,7 +704,7 @@ static void hpet_realize(DeviceState *dev, Error **errp)
     }
 
     if (hpet_fw_cfg.count == 8) {
-        error_setg(errp, "Only 8 instances of HPET is allowed");
+        error_setg(errp, "Only 8 instances of HPET are allowed");
         return;
     }
 
@@ -708,11 +714,6 @@ static void hpet_realize(DeviceState *dev, Error **errp)
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


