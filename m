Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9640D41D74
	for <qemu-rust@archiver.kernel.org>; Mon, 15 Dec 2025 07:51:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vV3LQ-0000Ui-Li; Mon, 15 Dec 2025 02:50:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3LP-0000R2-4A
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vV3LL-0000hl-TW
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 02:50:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765785006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rhRgZBDZXKiwx46WkvcU17DF2Qqr8XZ4jHsnYPyyOuY=;
 b=XbaJJh5Rmq8bvSn0Dk7/CShlH0NWjpVuHBS4JuHgm6vWrj2ZRZgsDTgipC/FiTXfxAYN3M
 e4S5BDNZibru7ATu2aiHG4hGgmutV+VdoBuhvQxt0SZ/bZ2kUIzTaLJbK7nttm4ynz+9hd
 EQMCOZVMU80Y4OPQTNvDYHRrECpeBjU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-IzTHvxCoOmeZpE850WJv_g-1; Mon, 15 Dec 2025 02:50:04 -0500
X-MC-Unique: IzTHvxCoOmeZpE850WJv_g-1
X-Mimecast-MFC-AGG-ID: IzTHvxCoOmeZpE850WJv_g_1765785003
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-430f8866932so635206f8f.1
 for <qemu-rust@nongnu.org>; Sun, 14 Dec 2025 23:50:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765785003; x=1766389803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rhRgZBDZXKiwx46WkvcU17DF2Qqr8XZ4jHsnYPyyOuY=;
 b=g7ftgWSgQ5PY/vBXYaymiRTrkzhgBm1IdJdpmDXFv04/giz2J6w62XUqauQU7w7/Zz
 9Bwu1p1kBfn9yWsoW5YK5QN9Rl7IE0pW9+fXn8upBazHJLoGZo4oAzB+ASALAQUwI9eS
 60FQMC2Qy+Ol9xxqJBLuz4s5eBpi0rUqvW5BzVObQrwv49jbGQLUHmAEHk/MkOH1JjT2
 AdfyB9PiV0QxoZAGqI0sNTHYgZKf+2dM49Ude5+Kb4SqxWV7Uv6EKGYcyJTLUy3ZS+TH
 yKsQlntBbk5q+7vmjXPafaXMVdOaL5+75OGgtIPU1O8toGT2nFYcXgPElGxt7qpkwdng
 0qOg==
X-Gm-Message-State: AOJu0YxhXbun76sLRvXWJ443RHkWlaF9XU//lItuQjEb55bV8Dxj7wWc
 s6eBPa5aMvmPlknbQGLMbMPXgbXfdkH4T4JuO+akkcr6hvdB6XywcuRfShfssZr6BY7QfjMNxQT
 5Xj5NjLk29u+VrQPrTG+rbhMbF1GJh6ShndI4McAk8eUeqIAw7Wj2wQY=
X-Gm-Gg: AY/fxX7eyjHqGu/np00hVG7rQh/JFidlxc0ss3k2vFRSLZWbmbsM92i7fnVJOVH1sBt
 Uvx7odzceGldsPA8SUZz0pjy1rvYDkzzO+IBKdHeM05G1RjXpZ0Bi/N30c6mG0tQKmmzBTJUdea
 LFqnFxUr0zQfieSb1x+hraCV033cRWK2jubARrrtPsjZho66ECTySg60TTt964GRvoEO5ydTtFQ
 jRq8rXK6hVVqq85ftvGai03aC63zO+x5RtwJEp1zt4/Hg/uiYxlbouSaNXRqhFEzw/7BdKjvTsx
 ocy6tgWGE0f9VjU+MIcsw8+ELcr3hs+M8rnqOl5/V5s8K3Y/OGfY/q/z3OYi67rbluhUZYWpL/a
 FzD1KThLmpbd8yNL0HZIbYp/WeqbH5bJFDrmYYW5ZHSuDgQOh93qP0zQ2+dkjy87F979+m3qVhr
 NaA8CT3eRVvyGazrY=
X-Received: by 2002:a05:6000:1848:b0:430:f97a:6f43 with SMTP id
 ffacd0b85a97d-430f97a7049mr3814566f8f.53.1765785002584; 
 Sun, 14 Dec 2025 23:50:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqzWkYCtIQMI05pCrS1XC2FNK/o+lp8XHVZDoel7bKB7gBh1YsDB/HKtBXjnGc+4FKCfjVyg==
X-Received: by 2002:a05:6000:1848:b0:430:f97a:6f43 with SMTP id
 ffacd0b85a97d-430f97a7049mr3814541f8f.53.1765785002097; 
 Sun, 14 Dec 2025 23:50:02 -0800 (PST)
Received: from [192.168.10.48] ([151.95.145.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b9b26fsm29771952f8f.40.2025.12.14.23.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 23:50:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	marcandre.lureau@redhat.com
Subject: [PATCH for 11.0 00/11] First batch of Meson/Rust build system changes
Date: Mon, 15 Dec 2025 08:49:49 +0100
Message-ID: <20251215075000.335043-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: htKEBg2sEE6aE2fG-NynpsY634ds27zsOzuP5u4Ukpk_1765785003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

By bumping the minimum supported version of Meson to 1.10.0 (at least
when --enable-rust is used), C objects can be passed to Rust targets.
This allows to simplify the build process, and possibly also to link
the executables dynamically linking to Rust's libstd which makes them
smaller.

The major snag here is that QEMU wants to be very explicit about the order
of libraries on the command line.  rustc has a normally useful feature
where it records dependent static libraries and adds them to the linker
automatically, but for us it messes up libqemuutil.a's stubs mechanism.
This is fixed (or worked around depending on how you see it) by patches
4 and 5.

Meson 1.10.0 also contains some bugfixes such that Rust can now also be
added to the Windows and macOS CI jobs.  This reveals a few more bugs,
such as the ones fixed in patch 1 and 8.

Finally, Meson 1.10.0 improves Meson's embedded Cargo.toml/Cargo.lock
interpreter, but those changes are still mostly internal and the
interpreter cannot be used yet.  The required changes are planned for
1.11.0; Marc-André already played with them for his GStreamer audio
backend, and a couple more users are hanging out and helping on the
#meson IRC channel, too.  Once this functionality is merged, it will
replace a few hundreds lines of meson.build code and will make it simpler
to add new devices.

I still expect that the --enable-rust option will require bleeding
edge Meson for a good part of next year.  However, as was the case for
the original switch to Meson, this will smooth out and Meson will have
improved much for the whole ecosystem.

Paolo

Marc-André Lureau (2):
  cirrus/macos: enable Rust
  gitlab-ci: enable rust for msys2-64bit

Martin Kletzander (1):
  rust: Do not link qemuutil into Rust rlibs

Paolo Bonzini (8):
  build: do not include @block.syms/@qemu.sys with modules disabled
  tests/meson: do not reuse migration_files variable
  bump meson wheel to 1.10.0
  rust: only link the Rust part of the code into devices
  rust: Meson now adds -Cdefault-linker-libraries
  meson: let Meson handle mixed-language linking of Rust and C objects
  rust: skip compilation if there are no system emulators
  lcitool: enable Rust for Windows cross targets

 configure                                     |   4 +-
 meson.build                                   |  36 +++++++-----------
 .gitlab-ci.d/cirrus.yml                       |   2 +-
 .gitlab-ci.d/windows.yml                      |   7 +++-
 python/scripts/vendor.py                      |   4 +-
 python/wheels/meson-1.10.0-py3-none-any.whl   | Bin 0 -> 1057029 bytes
 pythondeps.toml                               |   4 +-
 rust/chardev/meson.build                      |   2 +-
 rust/hw/char/pl011/meson.build                |  18 +++++----
 rust/hw/timer/hpet/meson.build                |  18 ++++-----
 rust/meson.build                              |   7 ++++
 rust/qom/meson.build                          |   2 +-
 rust/util/meson.build                         |   4 +-
 scripts/rust/rust_root_crate.sh               |   1 +
 .../dockerfiles/fedora-win64-cross.docker     |   2 +
 tests/lcitool/refresh                         |   5 +--
 tests/qtest/meson.build                       |   6 +--
 17 files changed, 64 insertions(+), 58 deletions(-)
 create mode 100644 python/wheels/meson-1.10.0-py3-none-any.whl

-- 
2.52.0


