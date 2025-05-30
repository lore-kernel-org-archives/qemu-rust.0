Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uKuiZ-0002g2-Fl
	for mharc-qemu-rust@gnu.org; Fri, 30 May 2025 04:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKuiO-0002Yv-DL
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKuiL-0004e4-1S
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748592220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTevlSH5ZQkYyW+Mm1Gr4K/vGmq39vmXxviFGBBggFI=;
 b=TRoARjckupRY9IuQkrQUXjc7fOKtJXcVUOYL3xM6CAItcKew4rkJcQxsXrt7G6+EUJw9cV
 3JXkbVbyDatbptz3x2GI4bqdxqkbxMwLlwKFKGszp57xqbdbQbi7LhMPfJdZgLy0nSqv7w
 Iiepsp/oo7DeZ7GKjJl+usF8Aw18GEg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-9Ig7Z9moOrSDfwfgLNQp3w-1; Fri, 30 May 2025 04:03:39 -0400
X-MC-Unique: 9Ig7Z9moOrSDfwfgLNQp3w-1
X-Mimecast-MFC-AGG-ID: 9Ig7Z9moOrSDfwfgLNQp3w_1748592218
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ac6ef2d1b7dso128592266b.0
 for <qemu-rust@nongnu.org>; Fri, 30 May 2025 01:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748592218; x=1749197018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VTevlSH5ZQkYyW+Mm1Gr4K/vGmq39vmXxviFGBBggFI=;
 b=qua2njQJpanTGz5G49+VJSVwebyKNJzswr7k8MqC5SrzbiyDMBI+u3faC1oyAlaR0w
 tKwMeCVY5HaYuz9f06eYsV0HPcSANnPJKOMQjI8kpX950hgE5D2JNiE46W2FSn1B57qf
 ezPjyNsY44TArRtwMzDIYKcJ0L7MS2wp74Wgzo7TaqP0gE6DvyrZFPtnyE1EWDuX8tZt
 SuXDWqliMx8i0zlGkFZwSTh1T2CltEz3YPr4QIRrJ0kXl8xEzh0sTnkQBbjHQCuYybeo
 fZU2G3viETCkuRx5XLgM5gI6bOAhEnh9cEIgt9If7GEWdaYsuyo0l9FyKDR5MrMlZEff
 y7HQ==
X-Gm-Message-State: AOJu0YyYvMIVjIh1D62740Xc7m624UKvLV8EHh2fc9rDOBtgTKBDCVsd
 DjupllVfGfrONtzTqmQF1VtAhvfLwb2RtnZ2e5B1yZXSRGPQmwesnRpm4jVrx5WRcsJKx7DKoYm
 LMgbkQfJePp5hGPj+bL9x7dcgHVbMN2HWjXdqOTg36sSVTYR3mTOsJak=
X-Gm-Gg: ASbGncunKU1yGmW64+kNGngKyBoUUhcx73RFiEIxUHkNi90XzSLqk0Txmtbtq13yUo3
 1NoX96ZdTAFxsD+nr4tE2rN6Kt161ghc81zyGKbJ19Ooh700T7c4i/OclrvMsX1sC0zwm4j0s+s
 htEuCRmeOJbEqRyLMdmQeo8QCUQwbg4WF8Op2FPTwFkWzqABgesieTV8rYckZ/fsB71IqJtzcMw
 MN7bJ3dBbB642Cz61tR4i9gUe+wxQaydZdjjnlevKLU9TjnOZoLZ2XIfm/mkA94ecVKsyle5nDx
 YEvetg92RGarkw==
X-Received: by 2002:a17:906:c110:b0:ad8:a935:b908 with SMTP id
 a640c23a62f3a-adb322ace09mr198481966b.30.1748592217932; 
 Fri, 30 May 2025 01:03:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQGKio6NRXHsSIQTnkeXtmtHWiIdsWF3pF0J1K64iq//5rjyAERQNoX6NCZ32Oegrk6NwjPA==
X-Received: by 2002:a17:906:c110:b0:ad8:a935:b908 with SMTP id
 a640c23a62f3a-adb322ace09mr198478966b.30.1748592217461; 
 Fri, 30 May 2025 01:03:37 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d82ccedsm283858666b.48.2025.05.30.01.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 01:03:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 11/14] hpet: return errors from realize if properties are
 incorrect
Date: Fri, 30 May 2025 10:03:03 +0200
Message-ID: <20250530080307.2055502-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530080307.2055502-1-pbonzini@redhat.com>
References: <20250530080307.2055502-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O6Qf-_m8s-9Et7WhWlkOLuzA4TKdD38baMKhC6yiSBs_1748592218
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.902,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Fri, 30 May 2025 08:03:47 -0000

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


