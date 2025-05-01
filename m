Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAcvF-0000JK-FV
	for mharc-qemu-rust@gnu.org; Thu, 01 May 2025 19:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcv7-0000Bh-NN
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:02:22 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcv5-0002KG-SD
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:02:21 -0400
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-85e1b1f08a5so46047939f.2
 for <qemu-rust@nongnu.org>; Thu, 01 May 2025 16:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746140539; x=1746745339; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zUjb2KvGlUZUFz83Ds0AOUfQl+OnRqVo67ED0F/0NGk=;
 b=DunsNhTouczSu6gQSlPVCZk/sGA54IGhDfwrSBIdZojE6RwAdRN3yrKgl0/NhHi3PF
 8SrN514lWzjzr7U7F5yEAwjktuNfTS24iBdxyIYdEW0fxdNuKLve1KANx6+1gDT0MGH+
 9TcTdCl4qZyJIyoTPx5mH8E/CniBSKQO1B++FJ8AzwU02aPmMu+CCKgWQDXJI95RrQ+I
 TUw4DTBk2ehrnqarYXV5Se1Kcq84yvjnABm4HOqQfgQ9o4VfCl2IkXHy1ZoEl3FUveXF
 511dSWhk7QVdHLO7fiaapmuHX3lHOZCdBaNgzxzb7PQ02ChSVbE+d17svJm2gtfLx7FK
 SbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746140539; x=1746745339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zUjb2KvGlUZUFz83Ds0AOUfQl+OnRqVo67ED0F/0NGk=;
 b=PBA/YY2PKKubY4tE8XkVsRnhUHHMnlNgEBsCszFm1oSN41KBEJLI9OrKJqSGa12WAd
 InOhl1hRxhPBPpPatoeJDQh7ArjVovgP9aCMrDvwmN/Z2dEITCF0iBFoW5flzPngvVcF
 q+ZJIb9HJKhz/HlcbbO4A5E385np5HJBq3znEMn8FxVn0nmizwAmj39CIAt5mNcuMMw6
 aFw383tkFpaF8gqo9p+Y1wYKXaUOkThW+Pe5uJoJZcQRIe3+XJmK+d9nPt6bZOItsbAY
 6Mj9Myb/2DbRL9zXmT08pnYFHpaiBmN+au/hnz5dtYCnmE4HijcfSRm6jXsACOKRQkAn
 XRlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBUAw8pVRkYDrGhPlZ9HgA83LL08HEjDeXr/XUxW/1qJ6QuR/kBu8IGVxJCVt/OInCoZjVt5IYo1E=@nongnu.org
X-Gm-Message-State: AOJu0Yw2TSmLC9KroDEkDzfJIrQXIfcEGFMMu2icGoPM70SNMEkFv17z
 B5NgnWKew0jqtPug5yUzdi2oX+0LkVWFyogToXOfP3gKJkkGuw/eUaDCNrVI81I=
X-Gm-Gg: ASbGncthMjJ4o3KBfj1iXDig24QMsf6iqlxv9yWF23M9w6RAnmdEeRb3LltRF7Ewbrg
 ZI1IO2OHxoaA08Y+HnCZc2LgIfEqanhBW3Hk1epuapJkroVDDaNQQd75/L9E7US8zbAaQD4qOmL
 KCGiyNe5giVUJ/g0f316GwkDDP0xzUk+3DNkHbY1QHAdYowFYT09W6hQC6NZv0dUyU3RVAz4QSd
 D3oqngFRllykBWK9lvyvhdOSI5LLhU7ww5LK/y766ITU7WkYAYSMV9V3pIJuLNnsrZGsH8EYY12
 x7mWEBalYgCLDY8ihYA/CsnFhEOHy7qBcfRekA9h6v2pmRPM2SsNzt2OPSI/3R89ca4/Uoazmj6
 ioNLcZnt2db8Qtdup3CiN
X-Google-Smtp-Source: AGHT+IGDUDncsBvBWJwDg7BzIa/I82Zpdo8gtA7hcl3jIYbKpZXoLqddwTobgck/GVTy/3rgXIEmzA==
X-Received: by 2002:a05:6e02:1522:b0:3d9:6cb6:fa52 with SMTP id
 e9e14a558f8ab-3d97c1cba74mr10472685ab.12.1746140538619; 
 Thu, 01 May 2025 16:02:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d975e6fbbdsm3386655ab.16.2025.05.01.16.02.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 01 May 2025 16:02:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-rust@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Eric Farman <farman@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH 05/10] hw/timer/hpet: Remove HPETState::hpet_offset_saved field
Date: Fri,  2 May 2025 01:01:23 +0200
Message-ID: <20250501230129.2596-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250501230129.2596-1-philmd@linaro.org>
References: <20250501230129.2596-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=philmd@linaro.org; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 01 May 2025 23:02:27 -0000

The HPETState::hpet_offset_saved boolean was only set in the
hw_compat_2_11[] array, via the 'hpet-offset-saved=false'
property. We removed all machines using that array, lets remove
that property and all the code around it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/hpet.c                | 9 +--------
 rust/hw/timer/hpet/src/hpet.rs | 9 ---------
 2 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index d1b7bc52b7b..47b8fc0d880 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -71,7 +71,6 @@ struct HPETState {
 
     MemoryRegion iomem;
     uint64_t hpet_offset;
-    bool hpet_offset_saved;
     qemu_irq irqs[HPET_NUM_IRQ_ROUTES];
     uint32_t flags;
     uint8_t rtc_irq_level;
@@ -264,11 +263,6 @@ static int hpet_post_load(void *opaque, int version_id)
         t->cmp64 = hpet_calculate_cmp64(t, s->hpet_counter, t->cmp);
         t->last = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - NANOSECONDS_PER_SECOND;
     }
-    /* Recalculate the offset between the main counter and guest time */
-    if (!s->hpet_offset_saved) {
-        s->hpet_offset = ticks_to_ns(s->hpet_counter)
-                        - qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    }
 
     return 0;
 }
@@ -277,7 +271,7 @@ static bool hpet_offset_needed(void *opaque)
 {
     HPETState *s = opaque;
 
-    return hpet_enabled(s) && s->hpet_offset_saved;
+    return hpet_enabled(s);
 }
 
 static bool hpet_rtc_irq_level_needed(void *opaque)
@@ -733,7 +727,6 @@ static const Property hpet_device_properties[] = {
     DEFINE_PROP_UINT8("timers", HPETState, num_timers, HPET_MIN_TIMERS),
     DEFINE_PROP_BIT("msi", HPETState, flags, HPET_MSI_SUPPORT, false),
     DEFINE_PROP_UINT32(HPET_INTCAP, HPETState, intcap, 0),
-    DEFINE_PROP_BOOL("hpet-offset-saved", HPETState, hpet_offset_saved, true),
 };
 
 static void hpet_device_class_init(ObjectClass *klass, const void *data)
diff --git a/rust/hw/timer/hpet/src/hpet.rs b/rust/hw/timer/hpet/src/hpet.rs
index cbd2ed4f6bf..9e681391176 100644
--- a/rust/hw/timer/hpet/src/hpet.rs
+++ b/rust/hw/timer/hpet/src/hpet.rs
@@ -544,7 +544,6 @@ pub struct HPETState {
 
     /// Offset of main counter relative to qemu clock.
     hpet_offset: BqlCell<u64>,
-    hpet_offset_saved: bool,
 
     irqs: [InterruptSource; HPET_NUM_IRQ_ROUTES],
     rtc_irq_level: BqlCell<u32>,
@@ -885,14 +884,6 @@ impl ObjectImpl for HPETState {
         u32,
         default = 0
     ),
-    qemu_api::define_property!(
-        c_str!("hpet-offset-saved"),
-        HPETState,
-        hpet_offset_saved,
-        unsafe { &qdev_prop_bool },
-        bool,
-        default = true
-    ),
 }
 
 impl DeviceImpl for HPETState {
-- 
2.47.1


