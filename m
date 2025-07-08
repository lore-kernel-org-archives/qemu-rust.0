Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED31C83F09
	for <qemu-rust@archiver.kernel.org>; Tue,  8 Jul 2025 20:06:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uZEaL-00010N-9N; Tue, 08 Jul 2025 16:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uZDSD-0000n2-Hy
 for qemu-rust@nongnu.org; Tue, 08 Jul 2025 14:54:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uZDS0-00086N-3c
 for qemu-rust@nongnu.org; Tue, 08 Jul 2025 14:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752000759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=Mg+LRjW7EeIx8KwF80QWsS26XdnrobqFK933mptNwX2gb5q0zHtQIc8jEA1OFbAaBQAk+M
 AZlB//2VVUyM9bJ3+VERoqOUGUiAJ7puMtGteSKMw1NiB7Jdr1S/NAav2OeDF5osVXcn4i
 Jjig6N+U+8Eop7a69RnfZXLpErALAEE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-VaMhDynmPiCeT8di0xKQFQ-1; Tue, 08 Jul 2025 04:25:34 -0400
X-MC-Unique: VaMhDynmPiCeT8di0xKQFQ-1
X-Mimecast-MFC-AGG-ID: VaMhDynmPiCeT8di0xKQFQ_1751963133
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-451d3f03b74so22220535e9.3
 for <qemu-rust@nongnu.org>; Tue, 08 Jul 2025 01:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751963133; x=1752567933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=oyf/g722Cbda6oqxjQHhQjrzteiIAccBTVfA/Dd0LPws3INsHhVOEiEPg0IgPTJQOr
 paTxlTGyYoeh2/2zqwYmV4+nJzxhjVaK55J8v6NlYiNzooRoJGdW8KsIud5RZDMXrLvp
 XJ1u2kfxlvAIdSudqxdps9CWY9u2A2K6T6vq0DXp0/NqlTQd96d94+2jxCch/ph6boks
 oc6ghQWWlgIkQ2VBY50G8uAC8EuaN2fBNe775VlsppD+eRqQjEtKeNRCFeqTnNLfWs2g
 HyGrjtgwo7b103avED0x5I2QZbThngWUgwrGdomRrX/m4lpjMfF99pmh94v+Ack3yM56
 7k+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOyjw6azqp8It6+Fz7dUgFRWLt9ouvWkxJ1YHgtSeb1taVLImi3wizLIz/oZQRvPT1Dgvtyuq+2Cg=@nongnu.org
X-Gm-Message-State: AOJu0Yz4mE3rMwKt6EbsVN+5CVMwxIM2hSaf5tKCrxalNR2L996LuY2Z
 wzIlpbaqJWGoTPiCx6y2R/DdGmfBPftmqkNhN/1dzNJToTYwjRuXn/MupvMJarHPQSpI20G0spA
 vAsowJtUVbt3XjHLU9XxP58+a1vY2Fpr8oCalqISe81PJ656sbmy2LjQ=
X-Gm-Gg: ASbGncu4iMZfZuHY8dTCWCPDcFhQRQt0j2kY6expK7y+NFunb/C9fTPsTXrDU1MLY59
 t38vDzfD9hJmxne7v13JNYO8OJkaoKqsT2Dv9CHEC2zjYzk2lkPPVXiAto+vwG+nAA8WXcjyzPQ
 Dc92AbKMaenH91qotYsClOt/5Nqa0IAXDCorrMpXoMoYudqPNTB117XrHcyqROjD29+NTXZEJTG
 IayEWuNi6e45fvt9tezQDWiZ79K19sOmg9LF/l/MfPoDMoFqGNNS6HQHR6jYNov5NDm0RkFlat7
 oYsuO7FqTE0c4AEzXFHAEwyEgh0=
X-Received: by 2002:a05:600c:1da1:b0:442:e03b:58a9 with SMTP id
 5b1f17b1804b1-454cd50a87bmr16815445e9.25.1751963132971; 
 Tue, 08 Jul 2025 01:25:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo/fcJF3fxMw3IP5Uovq/+WlU/pstWxinghusuEV6V/FHEQQ2MTZCnS03phJY5oeJwqma2MQ==
X-Received: by 2002:a05:600c:1da1:b0:442:e03b:58a9 with SMTP id
 5b1f17b1804b1-454cd50a87bmr16815195e9.25.1751963132570; 
 Tue, 08 Jul 2025 01:25:32 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.202.169])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd4938ffsm14438075e9.21.2025.07.08.01.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 01:25:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH] rust/qemu-api-macros: use syn::Error directly
Date: Tue,  8 Jul 2025 10:25:14 +0200
Message-ID: <20250708082514.49480-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703-rust._5Fmacros-v1-1-b99f82febbbf@linaro.org>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mkS3TGm3mSj7durH5vlYsrg23Z0DP9zOCPippit8dlE_1751963133
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
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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


