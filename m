Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uKuiU-0002bO-6a
	for mharc-qemu-rust@gnu.org; Fri, 30 May 2025 04:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKuiN-0002Yd-7O
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uKuiJ-0004dV-KZ
 for qemu-rust@nongnu.org; Fri, 30 May 2025 04:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748592217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T8G+ZwNewrKmt3y0x+FnEurAOu2EK1ulbB74Dqd2P+4=;
 b=XO+CEIsAwzGicRWDkyiGRGsnzM8tZt8Cc2yCzzUNzAkwWfzI9yuKcvI6TnOI5V2Sfle6yh
 31i7mJJbQxuuFGP2L+6yuxkItBAQtsvGwrvOS3trJQnCMicxz8fQ8xkBgC7JEeovJqKarX
 QT/Efqth2YrLwPvqix6xOakcVlYGXyg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-gWnAtkKNP0S9RTfuHyW62w-1; Fri, 30 May 2025 04:03:36 -0400
X-MC-Unique: gWnAtkKNP0S9RTfuHyW62w-1
X-Mimecast-MFC-AGG-ID: gWnAtkKNP0S9RTfuHyW62w_1748592215
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-6049c728b24so1200708a12.3
 for <qemu-rust@nongnu.org>; Fri, 30 May 2025 01:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748592215; x=1749197015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T8G+ZwNewrKmt3y0x+FnEurAOu2EK1ulbB74Dqd2P+4=;
 b=jtNckCZr2GwIad2LrmqRE9cELZEGQolbWnUwRxtiSYouYbAiDWhmG0fP9IGGAiMIim
 BMUR7qaLoDsP/d6aprYn5anHd8ip+NPIbAXlps2O/MTZRQasDtrCZwP5YS7YVUl4BB0Z
 LgQR+WUoUn8iAkcSCprR3MX4GhizgpIb1rzDbkZgOSJtlN1NgN6Jsn2focJt6BKRLu38
 pd4DDV5g54FsG/nIXIWGj52gHONlN6L5SfodXyxuAs0QU3WgONqNvkWysoAQVGp2G2TE
 9DniwSUXk7BLOlgxMZEi5Iyt87ZT1CJ5jyPkTLsk7GTnF/g315p8geRSipzAjTyEjSBz
 sU0g==
X-Gm-Message-State: AOJu0YzrcThAU/k6c2pACIGHVXoV3XGT85HgcsDjSn2lcuIBBK8A7LN0
 sjHIju+YeTs6rKmEWZvA7knhUHxpkSX2P4N/XFGQ/BKv8Av5FMD1xoswvcUUN7iOvSNFJfW46H1
 kz+bI7mgT2XZlgevTcvvLK7yXhUNreS0axxpCDwPQwsx1XMCWxanxW2o=
X-Gm-Gg: ASbGncu0a5sx+5w2dx8oBIEqi3oUMFi4ms5O9BHMap59iYVZQjp4AawH1dOCCqvZPQ4
 1n0H2Vedq+O2wDhLvGgOIFvTUWODIVt7yZMackLTkcfutob18rEIbJUyhW8t2+F3Ti3SJdhxs+c
 jPZi2WI3FG1il8Uz5cI3rXUnxYGJaSQWtVIUko2vc50BpYukxzLlU5rLdAVtpC2ErzM39yP5onK
 pnKhSkhJiUbe/bBLXCfw/Lk4+wmPJ+FW4BcrRFxY90VbpAlOe13XQ/hOswY70TwSRkL7MD8PrI+
 E4OI9KOHCgXdFQ==
X-Received: by 2002:a05:6402:50d0:b0:602:1b8b:290a with SMTP id
 4fb4d7f45d1cf-6056d673ad4mr1981994a12.0.1748592215226; 
 Fri, 30 May 2025 01:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLGzXezFRlg+nvYk3YPoKVr5+Ye7gtdDwNNem7qNeMTPnt09ZShpToc8TgQf2WbG4ALxvYwA==
X-Received: by 2002:a05:6402:50d0:b0:602:1b8b:290a with SMTP id
 4fb4d7f45d1cf-6056d673ad4mr1981969a12.0.1748592214847; 
 Fri, 30 May 2025 01:03:34 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60567141d48sm1232570a12.60.2025.05.30.01.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 01:03:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 10/14] hpet: adjust VMState for consistency with Rust version
Date: Fri, 30 May 2025 10:03:02 +0200
Message-ID: <20250530080307.2055502-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530080307.2055502-1-pbonzini@redhat.com>
References: <20250530080307.2055502-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qDzDO2CHYtMODOLzR6M-Chqg1iK9xaNDnLGi7PtiOeo_1748592215
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

No functional change intended.

Suggested-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/timer/hpet.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 0fd1337a156..9db027cf76f 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -328,16 +328,16 @@ static const VMStateDescription vmstate_hpet_timer = {
 static const VMStateDescription vmstate_hpet = {
     .name = "hpet",
     .version_id = 2,
-    .minimum_version_id = 1,
+    .minimum_version_id = 2,
     .pre_save = hpet_pre_save,
     .post_load = hpet_post_load,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT64(config, HPETState),
         VMSTATE_UINT64(isr, HPETState),
         VMSTATE_UINT64(hpet_counter, HPETState),
-        VMSTATE_UINT8_V(num_timers_save, HPETState, 2),
+        VMSTATE_UINT8(num_timers_save, HPETState),
         VMSTATE_VALIDATE("num_timers must match", hpet_validate_num_timers),
-        VMSTATE_STRUCT_VARRAY_UINT8(timer, HPETState, num_timers, 0,
+        VMSTATE_STRUCT_VARRAY_UINT8(timer, HPETState, num_timers_save, 0,
                                     vmstate_hpet_timer, HPETTimer),
         VMSTATE_END_OF_LIST()
     },
-- 
2.49.0


