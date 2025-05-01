Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAcvq-0000hs-SK
	for mharc-qemu-rust@gnu.org; Thu, 01 May 2025 19:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcvk-0000c8-0a
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:03:00 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uAcvh-0002Qq-CT
 for qemu-rust@nongnu.org; Thu, 01 May 2025 19:02:59 -0400
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-85d9a87660fso158793639f.1
 for <qemu-rust@nongnu.org>; Thu, 01 May 2025 16:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746140576; x=1746745376; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WnkKvB1b+3d0EeHxFwXj6FOWV545S5FRjaJFzkqSlRY=;
 b=Pov7hhVlARMLIOUrLv51J6nfu8MoPQsPlO80Vi3iSxh2gOKwXet/kpk7ZSS1SyNodv
 JdeJGZC1v6OQ3VfTqdRxBm8f2DPyBHxvqPO9EUZ+JouHp3gy7m5O/3uzQivsUKdVX0jT
 +Et2TyUE/Qqkqk2NKsMvX9JtMalIjTScbKByzLdRK5jyakCwZhVODZCUpopsklWTjp4x
 zYErjUW7Sx81fESxZS+FxMgyocfT1VWkEc/tkYriOdZNQCqDgemPM1ryj7ZYifBX7N/f
 V00ys7Rtqi66bJtJZo5NhkKREzObl/uJN6y+6TUc09GkAxaEEVRXNc5TqHve2zQEhbwq
 pWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746140576; x=1746745376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WnkKvB1b+3d0EeHxFwXj6FOWV545S5FRjaJFzkqSlRY=;
 b=KJostSA5ExHq5sBlkT5nTj4xnNHHXzdraekxKC8qeb7YSc3vaNWl/1+07A+0CfbtmJ
 ETw9oLA8ni7ZfiqG7c3Mplm+c18TxkMIyj3xpnrJ1iGWtRLHIWYQaEE/YcuLC5QyPJXP
 30xaJtZlyVsi6i4CRKuI9wOaiGrGxksDpJL55jPjZLvPuxoOCbT6e+CyaT2zWFZUXkBa
 sVmEIbNgkEB8U6onqhqhSc8QJ4g4oDsJV1pYQAPFMupMF7LcN++beqY+xv0ggNUuRIjx
 iHfYfaH1PEslgOAwpxO4f0G1UCPueRtwRZ/D8zm7o582qKOyBNWO2Vjm4eFofGCqnXxB
 Nrdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyF3mtJkw34nuKs/1WD/exHRzr2PBIs/cs1QiV0mWLX7bI4wSlvADd+XLof3L4fHqytyplfXQndn8=@nongnu.org
X-Gm-Message-State: AOJu0Yzy3COxXoi7/IA9NFQJkbOpI4LD5mEHcjxAsJEP0oFGqVL6nLzg
 a+UoVPVOWhqlX+9BVRns2YEpJ9b6eKpBrJ+rg5xsm+rGult3HZ2Sk8HFJuJM9cI=
X-Gm-Gg: ASbGncu1bck8sfgONbyPafD6yOQtI6DTMjcKw/bZtIUfuTiHiluVbgMYz1BdBDTwh8z
 rQnJOFzYvzUxzT+iYb99mvvlIEPmOKOfRuadopj1WzWilDa3+Sr4pVp1qU4vQJNe+sLCEbuOGIV
 t2aNvDICeJdjd6Kiw9Rl2+IQ9Zm0ChqMN3kwbSP1bYGIE/yxG7hzG9Y148rsEqKoVl8hJ417EpC
 cOocp5ZtLLwKvIKkIrnUbXSRicXG3r6XRGB5ILnUE1eIDwjSKYMVx2w/+Hhi0NEGvt/hhFrnFho
 CiYaHtSQeHPtA7POFQOeBsscRheR8bNK373ZSDnod6mkH+9+m1NaB0v5NnoJ7YUlIZlRv+wFt9T
 n+9+zmEnCReM6FKEKCMOQdIcL3WSDpQU=
X-Google-Smtp-Source: AGHT+IEiwebta2jjbmeb5yedYFDh3IKB0uoU2Du0UF3wCHzQ38JonuurTlwyuw+/UGzJLdk571OfdA==
X-Received: by 2002:a05:6602:4743:b0:864:6a74:b56d with SMTP id
 ca18e2360f4ac-8669f9b6da2mr136803839f.5.1746140574195; 
 Thu, 01 May 2025 16:02:54 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-864aa2f45adsm29354639f.18.2025.05.01.16.02.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 01 May 2025 16:02:53 -0700 (PDT)
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
Subject: [PATCH 09/10] hw/audio/hda-codec: Remove HDAAudioState::use_timer
 field
Date: Fri,  2 May 2025 01:01:27 +0200
Message-ID: <20250501230129.2596-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250501230129.2596-1-philmd@linaro.org>
References: <20250501230129.2596-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=philmd@linaro.org; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Thu, 01 May 2025 23:03:00 -0000

The HDAAudioState::use_timer boolean was only set in the
hw_compat_2_12[] array, via the 'use-timer=false' property.
We removed all machines using that array, lets remove that
property and all the code around it, like the compatibility
callbacks.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/audio/hda-codec.c | 91 +++++++-------------------------------------
 1 file changed, 13 insertions(+), 78 deletions(-)

diff --git a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
index 66edad280f2..92e1fe65827 100644
--- a/hw/audio/hda-codec.c
+++ b/hw/audio/hda-codec.c
@@ -187,7 +187,6 @@ struct HDAAudioState {
     /* properties */
     uint32_t debug;
     bool     mixer;
-    bool     use_timer;
 };
 
 static inline uint32_t hda_bytes_per_second(HDAAudioStream *st)
@@ -366,58 +365,6 @@ static void hda_audio_output_cb(void *opaque, int avail)
     hda_timer_sync_adjust(st, (wpos - rpos) - (B_SIZE >> 1));
 }
 
-static void hda_audio_compat_input_cb(void *opaque, int avail)
-{
-    HDAAudioStream *st = opaque;
-    int recv = 0;
-    int len;
-    bool rc;
-
-    while (avail - recv >= sizeof(st->compat_buf)) {
-        if (st->compat_bpos != sizeof(st->compat_buf)) {
-            len = AUD_read(st->voice.in, st->compat_buf + st->compat_bpos,
-                           sizeof(st->compat_buf) - st->compat_bpos);
-            st->compat_bpos += len;
-            recv += len;
-            if (st->compat_bpos != sizeof(st->compat_buf)) {
-                break;
-            }
-        }
-        rc = hda_codec_xfer(&st->state->hda, st->stream, false,
-                            st->compat_buf, sizeof(st->compat_buf));
-        if (!rc) {
-            break;
-        }
-        st->compat_bpos = 0;
-    }
-}
-
-static void hda_audio_compat_output_cb(void *opaque, int avail)
-{
-    HDAAudioStream *st = opaque;
-    int sent = 0;
-    int len;
-    bool rc;
-
-    while (avail - sent >= sizeof(st->compat_buf)) {
-        if (st->compat_bpos == sizeof(st->compat_buf)) {
-            rc = hda_codec_xfer(&st->state->hda, st->stream, true,
-                                st->compat_buf, sizeof(st->compat_buf));
-            if (!rc) {
-                break;
-            }
-            st->compat_bpos = 0;
-        }
-        len = AUD_write(st->voice.out, st->compat_buf + st->compat_bpos,
-                        sizeof(st->compat_buf) - st->compat_bpos);
-        st->compat_bpos += len;
-        sent += len;
-        if (st->compat_bpos != sizeof(st->compat_buf)) {
-            break;
-        }
-    }
-}
-
 static void hda_audio_set_running(HDAAudioStream *st, bool running)
 {
     if (st->node == NULL) {
@@ -428,16 +375,14 @@ static void hda_audio_set_running(HDAAudioStream *st, bool running)
     }
     st->running = running;
     trace_hda_audio_running(st->node->name, st->stream, st->running);
-    if (st->state->use_timer) {
-        if (running) {
-            int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-            st->rpos = 0;
-            st->wpos = 0;
-            st->buft_start = now;
-            timer_mod_anticipate_ns(st->buft, now + HDA_TIMER_TICKS);
-        } else {
-            timer_del(st->buft);
-        }
+    if (running) {
+        int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        st->rpos = 0;
+        st->wpos = 0;
+        st->buft_start = now;
+        timer_mod_anticipate_ns(st->buft, now + HDA_TIMER_TICKS);
+    } else {
+        timer_del(st->buft);
     }
     if (st->output) {
         AUD_set_active_out(st->voice.out, st->running);
@@ -474,7 +419,6 @@ static void hda_audio_set_amp(HDAAudioStream *st)
 
 static void hda_audio_setup(HDAAudioStream *st)
 {
-    bool use_timer = st->state->use_timer;
     audio_callback_fn cb;
 
     if (st->node == NULL) {
@@ -485,21 +429,13 @@ static void hda_audio_setup(HDAAudioStream *st)
                            fmt2name[st->as.fmt], st->as.freq);
 
     if (st->output) {
-        if (use_timer) {
-            cb = hda_audio_output_cb;
-            timer_del(st->buft);
-        } else {
-            cb = hda_audio_compat_output_cb;
-        }
+        cb = hda_audio_output_cb;
+        timer_del(st->buft);
         st->voice.out = AUD_open_out(&st->state->card, st->voice.out,
                                      st->node->name, st, cb, &st->as);
     } else {
-        if (use_timer) {
-            cb = hda_audio_input_cb;
-            timer_del(st->buft);
-        } else {
-            cb = hda_audio_compat_input_cb;
-        }
+        cb = hda_audio_input_cb;
+        timer_del(st->buft);
         st->voice.in = AUD_open_in(&st->state->card, st->voice.in,
                                    st->node->name, st, cb, &st->as);
     }
@@ -805,7 +741,7 @@ static void hda_audio_reset(DeviceState *dev)
 static bool vmstate_hda_audio_stream_buf_needed(void *opaque)
 {
     HDAAudioStream *st = opaque;
-    return st->state && st->state->use_timer;
+    return st->state;
 }
 
 static const VMStateDescription vmstate_hda_audio_stream_buf = {
@@ -861,7 +797,6 @@ static const Property hda_audio_properties[] = {
     DEFINE_AUDIO_PROPERTIES(HDAAudioState, card),
     DEFINE_PROP_UINT32("debug", HDAAudioState, debug,   0),
     DEFINE_PROP_BOOL("mixer", HDAAudioState, mixer,  true),
-    DEFINE_PROP_BOOL("use-timer", HDAAudioState, use_timer,  true),
 };
 
 static void hda_audio_init_output(HDACodecDevice *hda, Error **errp)
-- 
2.47.1


