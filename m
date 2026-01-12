Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89FFD25050
	for <qemu-rust@archiver.kernel.org>; Mon, 12 Jan 2026 08:56:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vfDii-00024z-4V; Mon, 12 Jan 2026 03:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vfDia-00023H-SW
 for qemu-rust@nongnu.org; Mon, 12 Jan 2026 03:56:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vfDiZ-0003wI-Eg
 for qemu-rust@nongnu.org; Mon, 12 Jan 2026 03:56:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768208165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=EXQ4zyu0sRJp77mRZXa4lRx69mJNUBHg/Q7ddVSqLZOyFVvYeu/4UgpGUI0LREP5r0D2kq
 h63cAFGCB91rVNx6CNmZheUsJh6KH+jl1Optm8en+wDOwzz7BMvPYDlqeMo130MZRCIYbi
 LvycrwNUcaRLZoEP7tAWehdPZgfYeeY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-EWUWBJZsPa6GfUkcSIfOfw-1; Mon, 12 Jan 2026 03:56:03 -0500
X-MC-Unique: EWUWBJZsPa6GfUkcSIfOfw-1
X-Mimecast-MFC-AGG-ID: EWUWBJZsPa6GfUkcSIfOfw_1768208163
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-430fc153d50so4530579f8f.1
 for <qemu-rust@nongnu.org>; Mon, 12 Jan 2026 00:56:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768208162; x=1768812962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=WZfn4yivuwp5huCEuSSrtwYDNvZV5jA7cryiK9Msl376JswPibLdT6a/NiJ0fvcMOQ
 NQQWtLbJj1Sb1L7iFPwhCQh7RfesVnbIVYm7SVghkH7GBQ6EccE6UxIhmZtlM8cha9ns
 8vD1WUjk0T6GaZBb8pfh5L6Z/qcKHlt71b+qsEP5MlxKiR2+bXqTCZXkC8gf5U2VfoHS
 rzUolj2SDzkGdBcGtZzKowjnXzB0fJMO81OCOL4Mp4CqYUVagOl+JYUCcuMs/E7g1pGN
 kVUpu+ou9ghoF9RpZ30nljZIzgo1rS4uk0+9bMmwVJRQWeKj1mksurA/CKyVSCjF5Lgl
 HmYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVErYRDqeYxxjFvxVgeuCnvilwaoNV8Ubzu2Ok4bY080HUjDWoiCZ6WiD/PaO10Z651jMrlxpl7pr4=@nongnu.org
X-Gm-Message-State: AOJu0YyPAp/hoXCD7cCDcqFoSbISHyOx1zWBrXk7fJ4WyWhkrJ0bdYzY
 DUV+X2CPzIALFdyvgh6x52QN2mFelTuLY68xRpoElAdhCzD/0tS03KojbhLnixiKCGc3AMxOk7E
 ABfnmu/U1mhNHaK9A/9458FtZFyonK9ZKOlp6mM0Vsh0C+1gjTraACwg=
X-Gm-Gg: AY/fxX7ZHnPqnjPgUjFJVi4xACIcsOBojCZDKeLUpfJrc90TT/w6o6wTGZNsDUQizlZ
 l1sZ0x7N2itK66ZyrAQBsDIZOJ5Q89QnayrxUWNbmecwgAUzBra0I8jMTr7cZG5tuRNbdzRAKBq
 5CeU1gbs3fDVD6yQz/dl8X3Wvxvi/tIcBufs3j0cBjkZMWcgq/6UiNnbJoIOkD7G/J87y6fgR3z
 k30cYWpnCzqffRyCu4YUHOFVQ52FofLjVMXcjvGvET+a+chq6ocGSJsNwlKn/7lu3OeTqkP+DBc
 6DufRnb2j+gKT+B4kpjULuJ2gmIVv37xJA49oTmBc71843buWFZstD1fZ4zD3gB5HZl6ut7ewEs
 /JMGwdxLt3xF2iHud2EG9TMU2BSsrM3YZxlWgemnqam6oMMI5B9EvmYANNejy7/I6Se1elGcbtj
 pitImIbCUNDVNovQ==
X-Received: by 2002:a05:6000:2f83:b0:432:e00b:8675 with SMTP id
 ffacd0b85a97d-432e00b8b3bmr10116353f8f.62.1768208162632; 
 Mon, 12 Jan 2026 00:56:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiwsQGTghOpZ5ozc2SUNPeWVHaYaQncDaxPOa165BSrGGrvwKqpMbwP/6KmRQl7FsOgUbRUQ==
X-Received: by 2002:a05:6000:2f83:b0:432:e00b:8675 with SMTP id
 ffacd0b85a97d-432e00b8b3bmr10116326f8f.62.1768208162286; 
 Mon, 12 Jan 2026 00:56:02 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432dfa6dc4esm15652199f8f.23.2026.01.12.00.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 00:56:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
Subject: Re: [PATCH] rust: Update Cargo.lock
Date: Mon, 12 Jan 2026 09:55:59 +0100
Message-ID: <20260112085559.953611-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112090900.880621-1-zhao1.liu@intel.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DWLTCKPM1sO_xjJQQIBDPPmk39j2ZvN0XJY3tJbHxs4_1768208163
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
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

Queued, thanks.

Paolo


