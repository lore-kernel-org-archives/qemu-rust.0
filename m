Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAnYQ-0001B0-Qk
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 06:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAnYO-00019w-7y
 for qemu-rust@nongnu.org; Fri, 02 May 2025 06:23:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uAnYK-0000ef-Ta
 for qemu-rust@nongnu.org; Fri, 02 May 2025 06:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746181411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GgDIE30XzoIywzR02KFIEjUl2Fse4v4IpzEPr0mViA8=;
 b=JUVZEGXLPLs01wciCpxw7wgiQblMFUIjHApf5Y7x/qroRDkedlWlYOsezZV2XjDVQDSvZP
 GEXZRRW3+iL7LQMUFW1ZYHfam4Jz+erZt+0xxKQJl5a1ALgtngTQmMvZayjO2oC+N7F9hx
 GvxoXciMx9Sy60KDmxd8A8pAoifTJAs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-ES-kUq4wPA-n9QxsshqPJg-1; Fri, 02 May 2025 06:23:29 -0400
X-MC-Unique: ES-kUq4wPA-n9QxsshqPJg-1
X-Mimecast-MFC-AGG-ID: ES-kUq4wPA-n9QxsshqPJg_1746181409
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3912fc9861cso475308f8f.1
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 03:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746181408; x=1746786208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GgDIE30XzoIywzR02KFIEjUl2Fse4v4IpzEPr0mViA8=;
 b=Fj9oodnbllbwuEJ6aQ1FP9KPWU0mr3XHgNBv2Csq4OcV+oSvAZ1OYWyliOW5h/mUqG
 3yp+dRBnI3vOx73wn8VlDVk6Gb0aQVD7kfyLuxKdbvuDVz60ggprJj/7rkbmENDnaPyP
 f5FcN9U8s8IV622dMcT18UK07DJDQw33kkFzYBhYFHNYTNf0OvgH7qZkrEcXjZvTUqTd
 vKTXyR8WZUlQiCXsoE17YEXEz7jCfDU7QnDrz/+NWHlfx/N08uJnPDrfOp+xyMlZMWBu
 Immunx4uqVoUQ9k6Iynn6QjscswV5jNano7sxmn7vY4JChbilnvKo6+69MY3hZ66SYxk
 efCg==
X-Gm-Message-State: AOJu0Yww5j+rmmJ+8YmH8h98yYcDLTu6lVDFC6SwcQhudxQcy5aMHMja
 4UbuYoEJysKx4d2UKV2fe/yLnynNgF+siHaaMXkbrI3LURsu5eXAXa/7DrSoLhwz6JHL8rDV+6R
 EoUm+KoIdx7BfP/bX99v1Kt6Lho+GQXQnvFh6lWHEmXP1F7/pmtnj3cKFGg0=
X-Gm-Gg: ASbGncv3Rv/OkBw8ElDY7kmanWsgLgtQhH/bUwdNhB2FpfCxzZ8UQsmmyT0ZIxS4ThK
 xF99n5yC+QtYpEnzUJRKxGnX20ZGFs474RWIrx0oqZMofLP2pDEnOx87LK1SFUmKclmd4bbnt9b
 KwT79Wk6xaXFAkQa5PGGCUruJk32Idj9F38m3MBw4sY4t/SCaUU6D8csWIHNR7jT3oJrGdY+Wxo
 zZVuYNH9rN4XW1KxvlaG1OaF7VE/1PMyS2jQnP8jCfLtCpvWTgoKTdfJWc4KGjMe5+bJ+xD9o45
 6uHpf/vtSXi1fKI=
X-Received: by 2002:a05:6000:1a86:b0:39c:310a:f87e with SMTP id
 ffacd0b85a97d-3a099ad62acmr1819903f8f.16.1746181408282; 
 Fri, 02 May 2025 03:23:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRzgtNEvTxvR9D0XSIaBpOuNpnosvpK5i9hJCbLJIrxsVq0m/jTT14S6CDisuK+/vtV8Q4gQ==
X-Received: by 2002:a05:6000:1a86:b0:39c:310a:f87e with SMTP id
 ffacd0b85a97d-3a099ad62acmr1819889f8f.16.1746181407961; 
 Fri, 02 May 2025 03:23:27 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.54.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89cc50esm40864275e9.8.2025.05.02.03.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:23:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 1/9] lcitool: use Rust 1.78 for Debian bookworm
Date: Fri,  2 May 2025 12:23:14 +0200
Message-ID: <20250502102323.104815-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502102323.104815-1-pbonzini@redhat.com>
References: <20250502102323.104815-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rf5AgzgRJmLlKh8KEImrwJe7bY7xpjUZLkdixYfbGRQ_1746181409
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.644,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Fri, 02 May 2025 10:23:36 -0000

The rustc-web package provides a newer Rust compiler (1.78) on all
architectures except mips64el.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/build-platforms.rst | 7 ++++---
 tests/lcitool/mappings.yml     | 3 +++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 52521552c8a..bfcbb431f10 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -118,9 +118,10 @@ Rust build dependencies
   include bindgen or have an older version, it is recommended to install
   a newer version using ``cargo install bindgen-cli``.
 
-  Developers may want to use Cargo-based tools in the QEMU source tree;
-  this requires Cargo 1.74.0.  Note that Cargo is not required in order
-  to build QEMU.
+  QEMU requires Rust 1.77.0.  This is available on all supported platforms
+  with one exception, namely the ``mips64el`` architecture on Debian bookworm.
+  For all other architectures, Debian bookworm provides a new-enough Rust
+  compiler in the ``rustc-web`` package.
 
 Optional build dependencies
   Build components whose absence does not affect the ability to build QEMU
diff --git a/tests/lcitool/mappings.yml b/tests/lcitool/mappings.yml
index 74eb13d62b6..2ac304b72ff 100644
--- a/tests/lcitool/mappings.yml
+++ b/tests/lcitool/mappings.yml
@@ -64,6 +64,9 @@ mappings:
   python3-wheel:
     OpenSUSELeap15: python311-pip
 
+  rust:
+    Debian12: rustc-web
+
 pypi_mappings:
   # Request more recent version
   meson:
-- 
2.49.0


