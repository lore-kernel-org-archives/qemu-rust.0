Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uMTDQ-0002v6-Dv
	for mharc-qemu-rust@gnu.org; Tue, 03 Jun 2025 11:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uMTDO-0002uo-A9
 for qemu-rust@nongnu.org; Tue, 03 Jun 2025 11:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uMTDL-0005Cw-Lm
 for qemu-rust@nongnu.org; Tue, 03 Jun 2025 11:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748963164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1IZ/LMxFnOz6iL4qEKoCw0elTKgAlsmAe4sD2ue5a60=;
 b=bUbHs7duAapejnPf1aOPC0YmgE+SRYKAK8FF67jwELRFx7EuNz8Nrfh4OUZheCFMgP6rvg
 fYhMTQiDtsH+6XEMp4sf8IwgkU4sSbLGXXfwqQ7UCm4hMExXVy34b0V4Dj5I2TuamozlyZ
 v+zm9amuksPjKJ7ghN36vn1n8aQEsfI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-JFcyox1NOY2MmAJjRZ2EOw-1; Tue, 03 Jun 2025 11:06:03 -0400
X-MC-Unique: JFcyox1NOY2MmAJjRZ2EOw-1
X-Mimecast-MFC-AGG-ID: JFcyox1NOY2MmAJjRZ2EOw_1748963162
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4eec544c6so2590262f8f.0
 for <qemu-rust@nongnu.org>; Tue, 03 Jun 2025 08:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748963161; x=1749567961;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1IZ/LMxFnOz6iL4qEKoCw0elTKgAlsmAe4sD2ue5a60=;
 b=aymxAQYY3gQBuv0tzgmddcRsY66EvHCHQoWAgD+R/d95nEWvvENC990jCcZ2cPlcWK
 gkZJQlUcrGFN0gzBJDIHK2uu7ctDpbnM+3aLDiTVw4QQ6yv05AvoiUTx2JaKJASkal6j
 oZhfdQGjuobVMkLSfr0qkoDWDeAsRXh/KqjP6Ufb8Xdr+TNVxt0qcjkEWHGDCpNABHu8
 ee55nq4S7K7Beyr0JPNGZ5GNy6ZSQ32ALoNCTi+q5H0MdESb5UKlXzHkiIFuU5E5kxHC
 +MxuEGOaUyNSbqP3TjnGnM+vz5OjzDxROEdutdjAMZGrgdBIUx1NwiVFtdjLINsw4bNH
 Xtew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMJKMuvkhUntsl5nx7OIZvPW6zFYhFReLjIoTzgIeazaFdTsTy4ksQzPA0FfIAj9yGZg25p4trGug=@nongnu.org
X-Gm-Message-State: AOJu0YxVwGQNg1y28zcLUItR7/uUkTuThD7zhyBdnCv8SHpLzdK6f1kt
 mqKp0jyzGFh7f5CeLr+yjfyjHhdoOojbWfv6katt2g3XJ6KY3aFCvdSYvAuRc0aC+knfTL0PMU3
 jhPK/4gt4erIfaL5jH+31yR+D9iO0pAT/kccTYflg27mR43dTH7blHZNEmkuo2q0=
X-Gm-Gg: ASbGncuiiNY3791v8Bx0CMxnxS3zMq2U2RHSuK1C3CvwDOnSlZdCU8O3EsEroJeRYcx
 l1DFvCmpeb0F6EXpS682Hcfu+slxyWkmg85IuLP490+azZxqH1/IyyAhi9flgx++8dzOxKzLBBo
 90TQ1MI0iCenReBL6OCQOKzUUhPKpHZeUqlUTHfpSqpfEm1EwAgDrEpVr2MkK0ZyXz1ZhgJ3Wa+
 E6weliQcOCXwnBj8WIdlLL2NsrqcTSEZTwMJWwtEHUbWrtNfUeABGhM1jh0gNxpEc2nEDKQ7EOy
 kLzr3CcC9IrgGRlSjRtfEwT0
X-Received: by 2002:a05:6000:25ca:b0:3a3:581f:9af9 with SMTP id
 ffacd0b85a97d-3a4f7a3dab5mr14036733f8f.7.1748963160929; 
 Tue, 03 Jun 2025 08:06:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq0XXSGu7SiGJd+x3FANEdqgdSaZCVP7iZvyozqB2WqrK3BQvVvX7C2oMIKPBeWO1vSq/4oQ==
X-Received: by 2002:a05:6000:25ca:b0:3a3:581f:9af9 with SMTP id
 ffacd0b85a97d-3a4f7a3dab5mr14036676f8f.7.1748963160406; 
 Tue, 03 Jun 2025 08:06:00 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.64.79])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe5b7bbsm18351391f8f.4.2025.06.03.08.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 08:05:59 -0700 (PDT)
Message-ID: <2b7be73c-d91f-4820-a8ad-6964a8331150@redhat.com>
Date: Tue, 3 Jun 2025 17:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] rust: qemu-api: add bindings to Error
To: Markus Armbruster <armbru@redhat.com>, Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250530080307.2055502-1-pbonzini@redhat.com>
 <20250530080307.2055502-7-pbonzini@redhat.com> <877c1uffj3.fsf@pond.sub.org>
 <aD7AbxghCc5VYDhu@intel.com> <8734ch5d5c.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <8734ch5d5c.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -KvFusAbk02tfwiI_xBvdqNM0hkwTlZ7SVAqrJoRH7Q_1748963162
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
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
X-List-Received-Date: Tue, 03 Jun 2025 15:06:11 -0000

On 6/3/25 12:32, Markus Armbruster wrote:
>> Then Rust's propagate has the same behavior as C (Of course, here Rust
>> is actually using C's error_propagate, so the two are equivalent.)
> 
> *If* we want propagate semantics.  I'm not sure we do.

Yes, we do.  This function is used at the Rust-to-C boundary and should 
behave exactly like C functions would: it will get an Error ** from the 
callers and needs to propagate the just-created Error* into it.

In fact, I had found this issue already last Friday, but then didn't 
inform you because of the (long) weekend.  Apologies for that.

Paolo


