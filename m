Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6767CA0EC4
	for <qemu-rust@archiver.kernel.org>; Mon, 11 Aug 2025 16:18:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ulVDh-00045a-73; Mon, 11 Aug 2025 12:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ulVDe-00045B-L4
 for qemu-rust@nongnu.org; Mon, 11 Aug 2025 12:17:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ulVDZ-00011u-In
 for qemu-rust@nongnu.org; Mon, 11 Aug 2025 12:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754929065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N1iixlpvzFigr3G7v1wnAjQ5V3Icot6W1f7E+nXTxic=;
 b=TMRcCHNigdMX8Gw0UBFW6xwutGn91NRbQZviGEQn8H1VzlUW48VvL8SoU/81EFlYeLi6lf
 s3BCIjL/gAiK8KYavAJVGZ6gfemlB2DqRHP/r+v5qnI23+QCkOFoaN8hzlT3HtUDHz40e0
 cVGrxIIS1mP1W/czm3F3Vn5KfYEnqDk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-hGMqDC7bNp-clSTBY4xb0w-1; Mon, 11 Aug 2025 12:17:43 -0400
X-MC-Unique: hGMqDC7bNp-clSTBY4xb0w-1
X-Mimecast-MFC-AGG-ID: hGMqDC7bNp-clSTBY4xb0w_1754929062
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-458b301d9ccso24649535e9.2
 for <qemu-rust@nongnu.org>; Mon, 11 Aug 2025 09:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754929061; x=1755533861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N1iixlpvzFigr3G7v1wnAjQ5V3Icot6W1f7E+nXTxic=;
 b=EYKW+cetdYOfJ4nKZtcOOzKCxCG/fOHUZ3hSvRCAMcIlQaYN294Kvbtwq5qOxXtwZy
 7/c0aGkShIGMg5PpnHrOgiP9jeC625gei5wIipDfvW9ZIQR67lhMIfGno86eJsoPnAFN
 fPqBmO9lDkA4Ki/+sAZ5osNP0GS2+/AADcEJkxyZX6eyI/u98IIFanWHkjzHLNiCZF3n
 1WIflTEZ+HS2l7Lny3LvDWYUGbP4+DIZ3KtnyTqlHB9sCOC3/NZ+XX291GMm80/dymaw
 rM8b9PHphfGd71HvGHuiFzRvcv2V7d/TVGNXXzDQS/g9zJkKY0yxlFw3NYCvlwYVs+J3
 D3sw==
X-Gm-Message-State: AOJu0YwmsGgTJZG39kV6sdTIqyir0vOpQbDT3KHrzvn/yEjigtdYlxwL
 2RDuIBQZgx/uV+794z+X/MUmbGdga29x/E0/hlGi05UtAndbodtCucVrZoo7eZEoqxJa3OKSJ9b
 hxXJ+KFgcZyy7obPJRYWX2xgenHmJNK+o7an+dmZrgkuEg/UvgU/eKJ8=
X-Gm-Gg: ASbGncs2Mpo+QFslDun9q3lHBzavyuKhPZd/6POJy/16cEIdpvgXjaKA6NQG+dTpTaN
 BTkUjcOveyV5DdxirXI0udE2xD7OZd8drzY/IKaJ1cTmTyiavdUjhv2+yAncDcLQTjiHQV2hcQ0
 +XTb4sUA/WLa1VmfaCTJTxbMOVTI+EB4+5Ob2RAYjnKIf+qyjyoHmUXLnA1iOERtl6cvP3wZ1f7
 WoEMnV8PJUzj04U46l9VQtBDscolSE/q1ZQFaCozM0SCjQigt6tvFNQN7hcaaZYN3l1+liTMmwI
 n22lKUXOVXR7XyCy74bkbQBSDolZjxaZwA75BIWvGQCb
X-Received: by 2002:a05:600c:354b:b0:459:d9a2:e920 with SMTP id
 5b1f17b1804b1-45a10b9ae16mr3256585e9.4.1754929061392; 
 Mon, 11 Aug 2025 09:17:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtXbuAIEQnWXh49iGPKRgyGYh0nd7HBdOb8u1ecMrcFAlXo5Is9Q4paztqRCBd9L3uKMv2jw==
X-Received: by 2002:a05:600c:354b:b0:459:d9a2:e920 with SMTP id
 5b1f17b1804b1-45a10b9ae16mr3256335e9.4.1754929060989; 
 Mon, 11 Aug 2025 09:17:40 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.234.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac036sm40907795f8f.15.2025.08.11.09.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:17:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	manos.pitsidianakis@linaro.org
Subject: [PATCH for-10.2 0/2] meson: let Meson handle mixed-language linking
 of Rust and C objects
Date: Mon, 11 Aug 2025 18:17:35 +0200
Message-ID: <20250811161737.220835-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JzbiC2KP10Ba7kNoYo3mYFZ8lqfFj8SLEE29RSqi8JE_1754929062
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

One of the pending issues with Rust's build system integration is
the bloated executables caused by the use of staticlibs.

For an example of what this means, see the following test:

hello.c:
    extern void hello(void);
    int main(void)
    {
        hello();
    }

hello.rs:
    #![no_main]

    #[no_mangle]
    extern "C" fn hello() {
        println!("hello world");
    }

staticlib + gcc:
    $ rustc -Copt-level=2 --crate-type=staticlib hello.rs --emit link=libhello.a
    $ gcc hello.c -lhello -O2
    $ size ./a.out
       text     data    bss     dec     hex filename
     917435    39593    352  957380   e9bc4 ./a.out

rustc + static libstd:
    $ gcc -c -o hello.o hello.c -O2
    $ rustc hello.rs -Clink-arg=hello.o
    $ size ./hello
       text     data    bss     dec     hex filename
     322684    14464    590  337738   5274a ./hello

rustc + dynamic libstd:
    $ gcc -c -o hello.o hello.c -O2
    $ rustc hello.rs -Clink-arg=-Wl,-R$(rustc --print target-libdir) -Clink-arg=hello.o -Cprefer-dynamic
    $ size ./hello
       text    data     bss     dec     hex filename
       1809     600     993    3402     d4a ./hello

The second and third methods will be supported by Meson 1.9.0
(https://mesonbuild.com/Release-notes-for-1-9-0.html).  Modify the final
link pass to use a Rust source file directly, instead of going through
a staticlib, when the target includes Rust crates; Meson will then do
the right thing automatically.

Paolo


Paolo Bonzini (2):
  rust: do not link C libraries into Rust rlibs
  meson: let Meson handle mixed-language linking of Rust and C objects

 meson.build                     | 19 ++++++++-----------
 rust/hw/char/pl011/meson.build  |  2 +-
 rust/hw/timer/hpet/meson.build  |  2 +-
 rust/meson.build                |  2 --
 rust/qemu-api/meson.build       | 15 +++++++++------
 scripts/rust/rust_root_crate.sh |  1 +
 6 files changed, 20 insertions(+), 21 deletions(-)

-- 
2.50.1


