Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8DFC5DF66
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Aug 2026 14:18:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wvyAH-0007e4-5C; Mon, 17 Aug 2026 10:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wvyAF-0007cS-Cw
 for qemu-rust@nongnu.org; Mon, 17 Aug 2026 10:18:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wvyAE-0001ee-5L
 for qemu-rust@nongnu.org; Mon, 17 Aug 2026 10:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1786976289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=CGWl3MY2qe/7ekBmx8R6sKRdjkILUc1YMozOeRvUbjrJ64VoZoJL/0GCJrgAsTSRw4SmJq
 jxl0cjYHien2PrftdmSy7CoDoPbPOJuiMEwMoj/BYfRzGpGboUaySvgv5gX4dqxLT4Dgbl
 x23rFYe4+vxYIrbkKxNAb6Nd8att2UY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-mg-umUQpMnmcX-TPyYZ8MQ-1; Mon, 17 Aug 2026 10:18:03 -0400
X-MC-Unique: mg-umUQpMnmcX-TPyYZ8MQ-1
X-Mimecast-MFC-AGG-ID: mg-umUQpMnmcX-TPyYZ8MQ_1786976282
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-47485fde05aso2020857f8f.0
 for <qemu-rust@nongnu.org>; Mon, 17 Aug 2026 07:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786976282; x=1787581082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=Xz2uBI6hV0+wa90UK7xq1Kdx0FTXdg6FIHylXCoYpVtbTTnKNlDeS02VlRsyRLu0Rl
 kdpZdeHloBXahEnOAQtw0+XwiR4nNlkcsvfigp/nHPsL1Q20FZyuyfDuRzrmmR1tXdRN
 laD7d8pxNnJZ0R+Kfvq5lzQtHm0A82+wQmF1yh3T35VAkwYXxMvC5xc6GdaGZpHdll6a
 D4MlOkKNwyPWHfqY7w2pF+LSlJCYshoyfC6fz8KP5sq0OXEWFdEYyeAtaaQMUbE8gBP1
 vp6TeAmmn6vX3h/dXgq6jEw2ygQZi2aMmDXehkGSZceyAGziaCbuRz83DIeDUFPCML4P
 TQMw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr262Ldnv/IK/LK0e0Tbds9HZ2JSkgQQUE8BwEgjjhNEmeWE5FYHDtjBXLwWvrudMs3N+D6to+gzJg=@nongnu.org
X-Gm-Message-State: AOJu0YwabW5YiUMmpn704RJKXWSdsa+97fpRMt3LUw9PtCyWUYD6wWcB
 p6IsrKiWcMxYsbI6pMKUGdoY5LmzsvFJBvfM1R3C+XKKLVic2x+4xOP416jmZc/D+bG/7vvUx4G
 E9/HA58aKqsfo4nPD5IwLhzBgmpa3BMx//+Or44rzn+OqBEO9KoRYyX8=
X-Gm-Gg: AR+sD13FEXFMLVs8FPMnvqFkpD1E+r2fsNVNmue7IZx4XdfkOwBDtp4drFaBFE9+pZ1
 nBgknBX0or4mLYo8ukj6pbTq3e1jeczIkIzTfehKcFYXg05ibT12gMXssdYiaMoF5T2918uyi4g
 rUvPc6gmgKY1DhWg0wQ8idmegLJxJ4uWqluhOwSvukRNOQdIIw8lAumlqNlxdWaJZ3KfcJv1l6V
 Qd7eJ5fEOxQ58Ij9m05gPVwJH9B9xp73YrsHKj5CRM32w7km86HskqXOGlAfBC47aItefGeFCZh
 1bqcT5MdqPQBrZ+q9a8uixWEbgWT6f4iDUMn1gZ7XzP6g/a0H9xFtdO/v8MmEU9oiu0EaQEjDb1
 DnSDwRwmin7inVY4443bJtyanef9wLQkIYlqN+p9iJyscKNElL+HJNyY/lpYk3LKWV8sZw/GBHp
 2+3tg=
X-Received: by 2002:a05:600c:46d4:b0:499:8aff:59b6 with SMTP id
 5b1f17b1804b1-4998aff59d6mr298798305e9.14.1786976281846; 
 Mon, 17 Aug 2026 07:18:01 -0700 (PDT)
X-Received: by 2002:a05:600c:46d4:b0:499:8aff:59b6 with SMTP id
 5b1f17b1804b1-4998aff59d6mr298797635e9.14.1786976281491; 
 Mon, 17 Aug 2026 07:18:01 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.34.92])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a3157fsm4238052f8f.3.2026.08.17.07.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 07:18:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Nguyen Dinh Phi <phind.uet@gmail.com>
Cc: pbonzini@redhat.com,
	qemu-devel@nongnu.org,
	qemu-rust@nongnu.org
Subject: Re: [PATCH 0/2] rust/bits: Fix minor bugs in bits crate
Date: Mon, 17 Aug 2026 16:17:59 +0200
Message-ID: <20260817141759.943839-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802170346.3493821-1-phind.uet@gmail.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2l5d3yf-zfAbBs5lcxEX9P8s2vZzSONXB2kW291Avv4_1786976282
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.343,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


