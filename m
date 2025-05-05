Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBrm1-0004WA-0h
	for mharc-qemu-rust@gnu.org; Mon, 05 May 2025 05:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBrl2-0003bQ-Ns
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:05:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uBrky-0005lw-Lx
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746435899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vRtlT+rfQp/A6Zs87LxR8mcqRVthqez4BmiYWwSHafw=;
 b=YKk8HUca/TlxcCcf/2RbEN72MJIm891xWe0J8RqKrDrtrWc94fl6OFsl7HU6CBbDoVSvMH
 HA/35v+gpVr1BTb1VA1U2PkYXp1Iw7/H6fmpP7Gw16JCQIuo61Swtt+PfdBzoWuvMwWSDG
 0qXBJksdca4eXRpGEJOCIVksPhT/tD8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-XxsSK2F9Pg6tCZpcl7OTnw-1; Mon, 05 May 2025 05:04:58 -0400
X-MC-Unique: XxsSK2F9Pg6tCZpcl7OTnw-1
X-Mimecast-MFC-AGG-ID: XxsSK2F9Pg6tCZpcl7OTnw_1746435897
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-39126c3469fso1061081f8f.3
 for <qemu-rust@nongnu.org>; Mon, 05 May 2025 02:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746435897; x=1747040697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vRtlT+rfQp/A6Zs87LxR8mcqRVthqez4BmiYWwSHafw=;
 b=gQtBSwpApg5l5VCs0iU+HZ5DmjYFeWKeFLu0eiJktcQy67sAKkiKtEoSkmNPV4beQ1
 8gJkp8vgU41eNtMkT/zj0G208BfD6SBY/97zzM9X6IAtSVV+izfoPwSr38mVhFVpso7F
 WFV/BfEFcotrFGmwmUk1cb86W2Jxt37iKAWfyIChPU3oV8/ZuFbC9iFUOIA94fQ4LsMJ
 NgfldcuHRz8RAs0B07KyUImIeqx9Y/NXUpim88D9qCMFInfmZINSEHC/noJ7ckLD0c8M
 pSMKrMiY2leNWkTEYezGAa8ONrf5cmEIETIXsgFSi0acyjTzAg0zvZw5tMCMD0HnwCWB
 3lmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8oDS5hd2lTAJg4bZ6i39roRUnNH288niQq0WTbP5bBT40T9peqDgmfUYnJjuVhWj3U4Y7R/qvkxo=@nongnu.org
X-Gm-Message-State: AOJu0YxTN+Svp8pMMYgCyizfcssWn60AmGMjsIi2Y/d00EhfhRAiCQbu
 KiYmvVrQWTA+PQrG2OgvGJExdM4wkrQRb/Gbx0QUeByhiUsVZb3h6hQZ2riIwMFcXFQnBylolQl
 02wcMQ4T8adrN468D648uokQ5hibhjuSl3WMF640UXxrkxwYZIZWdJ3eKUzg=
X-Gm-Gg: ASbGncviYk2MigI5T9t2Dna6kARt7OiCkpVkiDdJoFAzumbY4xBnxgs2YpdCjUbDp92
 pKlNleeQLo0vihp2X22ZCeVx2SJ5d4BahE+0oR2t5eLgFjKA+ymQyiOQaDNn7mKvAgVcIErPlz/
 uimC7B0k+7S+GTCrS232gx72PaR1mFdIneMMdkatBN1xNP9tHUuOALoSpJs1zjWiYFYd+AWw9+3
 B2Z2KZYB4KLoZCNMB5Rkp5tcOrxHHHlvm8LbydWEddI9un9UTCH0Sss06u/m1ANn3VjPXv8lazd
 XiEeXGyhHHw7tkY=
X-Received: by 2002:a05:6000:3113:b0:390:f9d0:5e3 with SMTP id
 ffacd0b85a97d-3a099ad1aa7mr10556837f8f.1.1746435896860; 
 Mon, 05 May 2025 02:04:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoTVyw8OSZzdXGEOBTSx3zPlsaB4qmHKSedrUa2N0vO7aivae0TFHtWZww5UkTGV9cxyFYyA==
X-Received: by 2002:a05:6000:3113:b0:390:f9d0:5e3 with SMTP id
 ffacd0b85a97d-3a099ad1aa7mr10556810f8f.1.1746435896554; 
 Mon, 05 May 2025 02:04:56 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b0ffcasm9765797f8f.74.2025.05.05.02.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 02:04:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: manos.pitsidianakis@linaro.org,
	qemu-rust@nongnu.org
Subject: [PATCH 07/11] rust: qom: fix TODO about zeroability of classes
Date: Mon,  5 May 2025 11:04:32 +0200
Message-ID: <20250505090438.24992-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505090438.24992-1-pbonzini@redhat.com>
References: <20250505090438.24992-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m8KA7_dqI5HNneT8ZS-LwI_bZ0Jj8uzrUjpAwl8JVrk_1746435897
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 05 May 2025 09:05:05 -0000

The proposed suggestion is not correct.  First it is not necessary for
*all* classes to be Zeroable, only for Rust-defined ones; classes
defined in C never implement ObjectImpl.

Second, the parent class field need not be Zeroable.  For example,
ChardevClass's chr_write and chr_be_event fields cannot be NULL,
therefore ChardevClass cannot be Zeroable.  However, char_class_init()
initializes them, therefore ChardevClass could be subclassed by Rust code.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/qom.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/qemu-api/src/qom.rs b/rust/qemu-api/src/qom.rs
index 6929e4d33ae..52e3a1ec981 100644
--- a/rust/qemu-api/src/qom.rs
+++ b/rust/qemu-api/src/qom.rs
@@ -534,9 +534,10 @@ pub trait ObjectImpl: ObjectType + IsA<Object> {
     /// While `klass`'s parent class is initialized on entry, the other fields
     /// are all zero; it is therefore assumed that all fields in `T` can be
     /// zeroed, otherwise it would not be possible to provide the class as a
-    /// `&mut T`.  TODO: add a bound of [`Zeroable`](crate::zeroable::Zeroable)
-    /// to T; this is more easily done once Zeroable does not require a manual
-    /// implementation (Rust 1.75.0).
+    /// `&mut T`.  TODO: it may be possible to add an unsafe trait that checks
+    /// that all fields *after the parent class* (but not the parent class
+    /// itself) are Zeroable.  This unsafe trait can be added via a derive
+    /// macro.
     const CLASS_INIT: fn(&mut Self::Class);
 }
 
-- 
2.49.0


