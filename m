Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAnYj-0001IX-TF
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 06:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAnYf-0001GX-A7
 for qemu-rust@nongnu.org; Fri, 02 May 2025 06:23:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAnYd-0000k2-Hv
 for qemu-rust@nongnu.org; Fri, 02 May 2025 06:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746181430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QzRX5l4/8S+wmKPEV9zweUNzezcyi85OyNacxdgQyIo=;
 b=EJqDGhIpK7RU3PB20Lr6A2OoCWrKwHg3C8AoxAyw7E5EUlk1z/ZYI9t1NrOAL2BX7SCXlP
 2QZtzpKk/BLi4K2jH/FEHk6MirWcUyVQzBUNYd7OVXIdobiAoqW1dUXo930CTSonSlrb1Z
 Ed3kq3ssF5Fy8ZJXJtWkqhWquB7HnuE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-ohqPOkNCOta-X-VYCKQKnw-1; Fri, 02 May 2025 06:23:49 -0400
X-MC-Unique: ohqPOkNCOta-X-VYCKQKnw-1
X-Mimecast-MFC-AGG-ID: ohqPOkNCOta-X-VYCKQKnw_1746181428
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-39130f02631so506022f8f.2
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 03:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746181428; x=1746786228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QzRX5l4/8S+wmKPEV9zweUNzezcyi85OyNacxdgQyIo=;
 b=h4NnS8uaKUs9U4mvTzhwSa6vy810TaQ5z/vJB5cDqySidHqBR3tegV7m04Zd0CeATr
 yRxyQ9iuTTdDe7TsKyls1GIDP5PCKg/m1XeB0z7yPreNxcpZC3eqdYf+IXLANC+9uHpP
 xg2BHF+1bA2ssfJ2SU6oeyV4SWqRd+Ac5JWtGVkRavsu13ZgkNlNVR/fPbt6VGk59US7
 mE4tFZbL52gS1LfyjX9337Pn83APLVEdxf1VT/B9QsyjuGTPKAEZShZ6zoo2l1OGpBp0
 nic0QrmocajAA4OX7qMoQ6oqjI0tKC5+NZO5USntDeeLwOa5/Jq8Glgt8YgNgXe82sMb
 scgw==
X-Gm-Message-State: AOJu0YwmU9wOr1mCS6h0kE6LCcDffqf+UM8KVQZoEut3Lk9GlDJZ2A6Q
 asua0XwhmMJ6SmFc99zhVRTZgeyUrEuVTYsDG6LuT2vdlRBIuLpsZ6mmvTSvp1TrGS2G3iUposg
 xc/5l3uqt86aWZyUEW8TQKs8m9VGlyGyUX93uU0IfcwzBjP9gA4I=
X-Gm-Gg: ASbGncvUzOCOcnnhR1ckK6NdcPEo1/12N70NiQT/donJgOsUd/L6m+Bq9XoZ2xJOlsf
 qMrlSEWddD5ulXBXm0oHPBGdbXz2SA66/siwE99sgJAfViULqF5NPNhWsHEYl3NSiW0kqn/Tod9
 5ru7gBK4cEFKTXyWycf3FyZNcyVp0YMKXe8Rsz61+PaIHC+Llvl9h6PsXd8nH0AxWpa3rFXbzux
 E+hd4bNWEpnWK6cVjjjdmnpmPa7k2vUB8EU8wJLrmVjqDRRshkx1Ij3vZ03e5JhxwABpzrpoWas
 2vfyp8uFxQrjclg=
X-Received: by 2002:a05:6000:1e51:b0:3a0:8819:3b69 with SMTP id
 ffacd0b85a97d-3a099ad61afmr1230255f8f.21.1746181428166; 
 Fri, 02 May 2025 03:23:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMCuL9/GFEL0oohdP93JrNdFJ3TfQpoPEVsACDzA5eV9MT/4vPp30JD/56X+ULw6GdjstbZQ==
X-Received: by 2002:a05:6000:1e51:b0:3a0:8819:3b69 with SMTP id
 ffacd0b85a97d-3a099ad61afmr1230237f8f.21.1746181427702; 
 Fri, 02 May 2025 03:23:47 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae0bb5sm1727497f8f.7.2025.05.02.03.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:23:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 9/9] docs: rust: update for newer minimum supported version
Date: Fri,  2 May 2025 12:23:22 +0200
Message-ID: <20250502102323.104815-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502102323.104815-1-pbonzini@redhat.com>
References: <20250502102323.104815-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -FkUFwaAOhLX2dBdWVT4IKOXIzS-7AoP5Q4avKOQAFQ_1746181428
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.644,
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
X-List-Received-Date: Fri, 02 May 2025 10:23:54 -0000

Remove leftover notes for Rust changes between 1.63.0 and 1.77.0.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/rust.rst | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/docs/devel/rust.rst b/docs/devel/rust.rst
index 92550d9d581..4de86375021 100644
--- a/docs/devel/rust.rst
+++ b/docs/devel/rust.rst
@@ -71,14 +71,9 @@ Building Rust code with ``--enable-modules`` is not supported yet.
 Supported tools
 '''''''''''''''
 
-QEMU supports rustc version 1.63.0 and newer.  Notably, the following features
+QEMU supports rustc version 1.77.0 and newer.  Notably, the following features
 are missing:
 
-* Generic Associated Types (1.65.0)
-
-* "Return position ``impl Trait`` in Traits" (1.75.0, blocker for including
-  the pinned-init create).
-
 * inline const expression (stable in 1.79.0), currently worked around with
   associated constants in the ``FnCall`` trait.
 
@@ -103,12 +98,6 @@ are missing:
 
 __ https://github.com/rust-lang/rust/pull/125258
 
-It is expected that QEMU will advance its minimum supported version of
-rustc to 1.77.0 as soon as possible; as of January 2025, blockers
-for that right now are Debian bookworm and 32-bit MIPS processors.
-This unfortunately means that references to statics in constants will
-remain an issue.
-
 QEMU also supports version 0.60.x of bindgen, which is missing option
 ``--generate-cstr``.  This option requires version 0.66.x and will
 be adopted as soon as supporting these older versions is not necessary
-- 
2.49.0


