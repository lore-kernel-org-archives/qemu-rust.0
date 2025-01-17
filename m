Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYidD-0002XG-TH
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 04:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYidC-0002WN-6x
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:27:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYid9-0003Os-PC
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 04:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737106026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1sWErDgBgStcF4IIFiG2aKGTxEPfyMd9ElyExlJqlCM=;
 b=CewrRwXXBouFJYLywQhfB8UiU19+WhplrJtUpYAfkdfFyaXi8/HKVNLKIur/7BgF3YZETv
 l8L/w3lZyOMN6zYOVPlchBr+2T9QBCO3CHZ9Jwd9wglZSQjhYz6e4qxqvs0BuhN8Ya8ur4
 6qFXUtvp6VqT2DMAcgWxu3Us1DAfGaM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-aY8gMj3NPqSjcmempZGWRQ-1; Fri, 17 Jan 2025 04:27:02 -0500
X-MC-Unique: aY8gMj3NPqSjcmempZGWRQ-1
X-Mimecast-MFC-AGG-ID: aY8gMj3NPqSjcmempZGWRQ
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-aa634496f58so186374666b.2
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 01:27:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737106022; x=1737710822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1sWErDgBgStcF4IIFiG2aKGTxEPfyMd9ElyExlJqlCM=;
 b=TILLDjg3C8R6KORjYLyuIWftgq/XpZSToCVSgozaIx5bOylszA3RpxAyzuSDW2O3Sw
 IVESPce623Xut8IYFUBsQ3oHgTVNTVfF5E/jW3lWufuQUsCNUrOBsLIF25ACw7C0BhPT
 YDqcKl/7QPBM1urjQV/bJXJiR+zpKqfzw36ea2pIZ9r2sEySe5rsNK0LfxLxpTaJR1jc
 mcggd5/CBwIlshhisN8h2h5ZV25tbZB8gZJ+KbJzLsClcJVPVdLkfIFcn8FVZdEiFv9A
 5Bxak46/aQJto5hsO+sMjanxSTMyAZ0UsX/NDNwnQBbneEyOEJIpT5E0bCkDb5BE/90D
 t8Og==
X-Gm-Message-State: AOJu0Yw7ElWeDvQSBBAKLYgJyhO9fgqIRPNT9fNGhNwcfdtpIdhiPDPF
 2E8LbAS0dGRFuG4r3Dpa01GE5+bTBFm4VjSaDiLsWad6CPzbJo+zhb3pSpcd3JJFsS6jH5h6XPH
 RhjIrOYaf++T85PTm9iPtIJ2lsr53GELBVdhP9JJozUw7gVnbMmc=
X-Gm-Gg: ASbGncubnAjav30K7nut/5zjGlLaqyyIpOIjJf9PfzHKX2IFOLZSI36lIaqwR6iicGF
 Adt8BDA7rerd7uQLMD7d16IUqZca/bV7KgBAcN1n6z2gMejKbBviMGU3hpsJ8pb65cyVhi6BmB1
 pC84bpTQKRYJARQcO2UJHFKYNa7qjy0T3khnsXcQeLMKO9q3Vn9za9etqY+zWfBfhctWs1jSGKP
 irluoNsapaG4VT6FGBUmns144KMSMrU/YCZI5ox/grHWJlZnVTzvdbkEPEy
X-Received: by 2002:a17:907:98b:b0:aa6:aa8a:9088 with SMTP id
 a640c23a62f3a-ab38b44d471mr186960966b.41.1737106021699; 
 Fri, 17 Jan 2025 01:27:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEk6bG2UE+cUPVwBEJo1OkWk6DXnHkUE1Q7mZ9OfUwZKkowqMCw3iuNOMc2f8aHnNafDdTF0g==
X-Received: by 2002:a17:907:98b:b0:aa6:aa8a:9088 with SMTP id
 a640c23a62f3a-ab38b44d471mr186959466b.41.1737106021300; 
 Fri, 17 Jan 2025 01:27:01 -0800 (PST)
Received: from [192.168.10.3] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab398ac5879sm14112366b.162.2025.01.17.01.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:27:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 01/10] rust: pl011: remove unnecessary "extern crate"
Date: Fri, 17 Jan 2025 10:26:48 +0100
Message-ID: <20250117092657.1051233-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117092657.1051233-1-pbonzini@redhat.com>
References: <20250117092657.1051233-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y_UZiHY1KXDnSWWbNZ09zlo3ZX-v1mxtFsDxW2-7Ehc_1737106022
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.093,
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
X-List-Received-Date: Fri, 17 Jan 2025 09:27:10 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/lib.rs | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
index f30f9850ad4..d10f0805aac 100644
--- a/rust/hw/char/pl011/src/lib.rs
+++ b/rust/hw/char/pl011/src/lib.rs
@@ -25,10 +25,6 @@
 #![allow(clippy::upper_case_acronyms)]
 #![allow(clippy::result_unit_err)]
 
-extern crate bilge;
-extern crate bilge_impl;
-extern crate qemu_api;
-
 use qemu_api::c_str;
 
 pub mod device;
-- 
2.47.1


